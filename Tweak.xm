@interface VAToolbar : UIView
@end

@interface MainNewsFeedHeader : UIView
{
    VAToolbar *_storiesBackground;
}
@end

@interface CollectionView : UICollectionView
@property(nonatomic) BOOL hidden;
@end

%hook MainNewsFeedHeader

- (void)layoutSubviews {
        %orig;
        
        VAToolbar *storiesBackground = MSHookIvar<VAToolbar *>(self, "_storiesBackground"); 
        storiesBackground.hidden = YES;
}

- (struct CGSize)sizeThatFits:(struct CGSize)arg1 {
        return CGSizeMake(0,65);
}

%end

%hook CollectionView
- (void)setContentOffset:(struct CGPoint)arg1 {
        %orig;
        self.hidden = YES;
}

%end

