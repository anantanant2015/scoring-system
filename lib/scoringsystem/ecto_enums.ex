import EctoEnum
defenum(InstrumentTypeEnum, :instrumenttype, [:physical_commodity, :company, :comment])

defenum(UserTypeEnum, :usertype, [:trader, :researcher])

defenum(UserStatusEnum, :userstatus, [:verified, :not_verified, :not_applicable])

defenum(RatingTypeEnum, :ratingtype, [:user, :instrument])
