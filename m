Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054AD1DDC1
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 20:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707942947; cv=none; b=RRVssChIEmm2i+y4DPm6rJvtd0zcpMzmO4JA6kgFXUtcFrP4BxEJ73CXRPW9HqXWwBOGJert4/9cszVb7LiE9IjWcKQSzKvq4TZOmt17cN8Kqievi/5HFvtnlyx9+sTA2VowN5CLJKgxVFZqoSXGbfJraGivZHj2tw7zeZM4Ki4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707942947; c=relaxed/simple;
	bh=AwNGRr3P6UeHkwkfGk+RMyvN6HM4hjPVJ6icGLILO+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKmrAe2tGdwqJitmwgomGpFfZa/o+lhlg4PLaV74Rv4kqr3aaQqyqswQOiKZ4qiuRblakKxq162sy1zt7Cn0ACsbJbXbsRTfAhi0pegf6nNQb5wvVKZRVZX6JVa3V44jyEWlOhT3uNirlJgda+mnod+O1qjhT56S05ekklYA77k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX2eQLMP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX2eQLMP"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5639b00a25cso239041a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Feb 2024 12:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707942944; x=1708547744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoK5DDGECT3y2yC/4x+K2eF6VlIMfrM4/DtWMEfIDm0=;
        b=IX2eQLMP5Wd7P6Ph2cpnz79p4ItPnprSJ93nK/AgceIRmrJC+Mh/vrchj7CPQgHfNH
         Wojw8JWnjINK2M353FqdgwX+OeRdF45XSD1xvvl/lCSkbhkXoqkBbYuSH2aD3ow5BoHg
         YOwHrDFjjCMTAFfI8noLXIAsi4E2nGxP1scKvIOqvM7fZ/htviXIilUZiADX1p4LYQS/
         61iRdHEvcbrLpTZ9bHje6fcFILJbzmapD/alA3F7HK+kXrIJzWWdOkJ/Cs151rj3zWZp
         /nfVcTYReE6Yzanwvmp2RoZ3hnC97+c1LvAvtSMJzvE4zhkJXSMLStrI8WdjkHPecf00
         Z46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707942944; x=1708547744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoK5DDGECT3y2yC/4x+K2eF6VlIMfrM4/DtWMEfIDm0=;
        b=wV8ZLsjHwp1yx5ga7M5lqb63DUjEkfw4zl6SDlWw6McsjlZYHXgTxiFeGhaR2PR4y+
         rjqDm+Aqtc6sfhiHZEuy47a/YvAwNZONnPWZVICioqNoUL71CxI+QRjEOZu9Q9eq3ZbK
         /n8kglv0GnD3xSOBVp7zCXC8kOPypxFUbls/fN12hLdsrme8SvJm2N3ICR8CQgrdE6jQ
         mc/Tkyuks8i2xLJXwSAzQhKWpfMXsRKtA5Nay9Qb79yttkmRvOjgXakrRRBzC8VAwDhZ
         KuDfkImE2FKnQwCdKdrf7FaxvDJDWSalMGl2IQTIyV/dyDYGsAE+SESw8m0r0QY5jOBb
         53LA==
X-Forwarded-Encrypted: i=1; AJvYcCXmCaZuBtvbYlPKwKO1rY1g93GjR2lO3dQRj47IbHPza4Zux8Tn3+z9wrzhbMjwMGIjM9Ph6sEpOKdnjynKWSE/I8FJl48na8OqDpY=
X-Gm-Message-State: AOJu0Yx9HF6qXtESGZPns8f8oN3ulhpa6NSVHA2K4BtiDCaAcM/XKajk
	WfBR1A4qxzFsEsY0JNzec2zqMIX6SxuUPRQSA5n1x2HnXCv0uUSJ
X-Google-Smtp-Source: AGHT+IE+6v6GkktwOFy5sYNfQpUQjHr1S06/NsGtwNn3OxmYTmNEbUvMzaogP/sq4WjmIpKbJQCNrg==
X-Received: by 2002:a05:6402:2ce:b0:563:7ee0:b865 with SMTP id b14-20020a05640202ce00b005637ee0b865mr1930319edx.15.1707942944090;
        Wed, 14 Feb 2024 12:35:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNoa72Uu049WhSseEkbY6cpFGS1+Y7YTmDO7b4fU8At5Xq076737IJXdhaU2dEVwGWonzTMEUIlohLFHnCfBszBvLRR4bgUEXZejEEBwU/aRkosYABU9RauERH6+i6yTiQOJXMEmVbRoV1txWhydTAlG8OJpMjdwn5ixSkvsuFa7daogC9HQXDQXrOFO+YEgbK9jUxWdjpxnPdXXy+aNZB2XKSRQ6NlulC2ZhTy/ju2OtUTaMqGhia7Fv1AwMBy2wfIuXXuL9hq9SZYdl6SRFNzybrqP3gl4sskhVFXp5R5FaBcWqhhXg/xoYF6yFUslGtJG9VG+Ueu/vQEoQAvG8ErvJW9jEWSYm/4JA8radzy1/Ml/CmfxGJ/3P1L1xgnGSRsZBBcfqx16o7/CvLrRdshktygZrXw6HwTewDf/IBTbN6l4Dp4/2M/2BqO3mBNoEahyxDAOC4HX+FSJcdpJIlQN5jwvY5bHjNJhUaoAsi7PNwYZllhxUGrb1/tvRKhh2+qSQgFU65ZdnIjDxRJEYFZUB0vIBdrZQzE6i6SZorAzrNvWSKje9VY/+G04TNApmG5UAPTShhfQR/XaEKyd0O/psySHsdeWDKIiSVo7hoLCqhpUi8Ww==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id fe9-20020a056402390900b00561ffe7adb2sm1627977edb.1.2024.02.14.12.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 12:35:43 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 Maksim Kiselev <bigunclemax@gmail.com>,
 Bob McChesney <bob@electricworry.net>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v4 4/7] thermal: sun8i: extend H6 calibration to support 4 sensors
Date: Wed, 14 Feb 2024 21:35:42 +0100
Message-ID: <10416904.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20240209144221.3602382-5-andre.przywara@arm.com>
References:
 <20240209144221.3602382-1-andre.przywara@arm.com>
 <20240209144221.3602382-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 09. februar 2024 ob 15:42:18 CET je Andre Przywara napisal(a):
> From: Maksim Kiselev <bigunclemax@gmail.com>
> 
> The H616 SoC resembles the H6 thermal sensor controller, with a few
> changes like four sensors.
> 
> Extend sun50i_h6_ths_calibrate() function to support calibration of
> these sensors.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Co-developed-by: Martin Botka <martin.botka@somainline.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


