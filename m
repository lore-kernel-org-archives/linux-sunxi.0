Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108AC173
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jan 2022 12:50:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 25-20020a05600c231900b003497473a9c4so5500285wmo.5
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Jan 2022 04:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=6Y1Ova7Y1eOHP74TgEiFjPPk+lw3tUNdNdvPlgpu9No=;
        b=RtjWIbAtRny80mz/OpmyKJ9FC9+6jLFxBi1LOeq1D08R8ox/YYC9dIhi/RR+vuuY+0
         xBPqA0HJKsRhn0HRiCMJcmp3K5gneAiuh7BbFne9+7Q6Svu0xRSu2hUSRlTUwj9SJ/ro
         ntlzb6FK7uGuObaeT1zn1cyF+gKFOKp6O5bm2U9tst+uabLJ0R5WLvwI5Vip9Qa2/tpl
         quwnGyWi0M/39GvFJV0ehHCLRNbh+EshK//WyZDGqMkh/9yItgsfkvaqvkkhq0sNl8lw
         ZoKlOxX7jHZhSgm2AEFLfmQiXdqakvNIjZWcGloCn8SUn8q0Cc6MeWaSFer36O7U9bRt
         GTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=6Y1Ova7Y1eOHP74TgEiFjPPk+lw3tUNdNdvPlgpu9No=;
        b=a8D/RSPMqSMvgeVL0UBYz5WD2l4ixq9BnXx4DFXFEr2RhA3TIaTYlHrCp8Ugit/Ld2
         u2fqcSLqzn0lEmd7BjH9y6UfeldA1Cy3XLLZdbrRmZ/rs/MxF8BwaJN1crNGQscRuM6P
         EA0D3Q5Xf5Us67sQ+kPcmjrXVpeeuiK/BlmVRAccYtOYPOOSZ1JGZKKXhRva4zy7nBQb
         NMKkBgh5TBs/asq/SZ2HG+hzMzccuKAkNbd94oNnOsh8C7vMfa2r7XvROLuAYILSi+NS
         Q4Ts91Ujn9gUpIjwQxwuVwnrsoMWHRS5D6Xy5e3d1+47SDWYPUuqXghwZ7GWJydnPKZY
         V7Qw==
X-Gm-Message-State: AOAM532O1ompf6OtPDog16rBdZCCg7SO5D9MxpPdUhjU2+FEA29csb8N
	KJOjw+tJbzIwSIoDTZvWK5g=
X-Google-Smtp-Source: ABdhPJyDSrvcv7mWnHIq6RZY+NtmzayswEkL/ZHaSgHVOBpfNr4TFBPTmJ0DRNqLKr5usyY9+ic0MQ==
X-Received: by 2002:a05:600c:3488:: with SMTP id a8mr24525180wmq.131.1642510255432;
        Tue, 18 Jan 2022 04:50:55 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id o8sm10636835wry.112.2022.01.18.04.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 04:50:55 -0800 (PST)
Date: Tue, 18 Jan 2022 13:50:52 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhangn1985@gmail.com
Subject: [BUG] pinctrl: reg-fixed-voltage usb0-vbus: error -EINVAL: can't get
 GPIO
Message-ID: <Yea3rBmY+MO4AhhV@Red>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello

As reported on old googlegroup sunxi mainling list, on linux-next-20220118, USB storage fail to bring up on orangepiPC.
We can see some error logs in dmesg:
reg-fixed-voltage usb0-vbus: error -EINVAL: can't get GPIO
reg-fixed-voltage: probe of usb0-vbus failed with error -22

This is bisected to: 8df89a7cbc63c7598c00611ad17b67e8d5b4fad3 pinctrl-sunxi: don't call pinctrl_gpio_direction()

Reverting this commit lead to a working USB storage being setuped.

Regards
