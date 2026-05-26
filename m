Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ED030DD0A
	for <linux-sunxi@lists.linux.dev>; Tue, 26 May 2026 04:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779769063; cv=pass; b=WHdCpYbpYfkQ2y4x9JDqCmjAVB5KNV80G0MyOphAazG11SnX6DBSYpMbjkOW+0W+riN5OYtlCsnmH/o2v5/avF6CI5LHu0QYNP7tZ27/t2DjqpAzPknjCZPuWRN34IywM89ir1tJ6M8wik0LCqkJST9W8vGNvjgWEk7kbQMR4hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779769063; c=relaxed/simple;
	bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vfzu7WuP5M4Yg2epqYkb1GM0ElKjA5T9VGzI+goyBqvWnQ73+brpKvVq1aWrukQNsBj+LHl+cQenVtbr6zYLGJ79h32/c1+pvbBJAuOc8zer9qOcLTMWtPTNhupEUlmMLkgzmU3Ivbqstq0FDHSvjj+fEbkKY/nwNwt+P57dEuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7i8LjSI; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7i8LjSI"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-366330b6751so7971328a91.1
        for <linux-sunxi@lists.linux.dev>; Mon, 25 May 2026 21:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779769058; cv=none;
        d=google.com; s=arc-20240605;
        b=QnL8efALAkRka8cUnmGP2MaJY/7JBV5DQRNgtL0fvKnjDgyqScA5rHN9Bie6o8ubWi
         gwlDNByO6lvH+7G9Y9yxrhe6X5j75cWNcBeKgsJtsUiVwdidor9qOB7a3camJwwXt+Ha
         isFVAid/fqlDMyNnw+eeuqYVcM4+oOuljWgDvBNSixZofoUY/D5fsmueNot12QlWVGLI
         IKUl8O+pWDUC2Adf9B4y3d/WERJMgzzNWq1DQF5LEh1Ao7qvKp18g8nofYynbAYXzuWJ
         D1TPm2V9nS6RYjGvrJFDgU006T+eRWSJLcvKkv6rInWRGgK7kKqfEVJGIt77JKyaCsYQ
         /jGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        fh=wtEJWd0mp4TwSBksBK6+x0s+eJ7Ou8cu7NoHxu0smuY=;
        b=G4rv4aAgeM8ICx12CZPtUd0x6zbPVLMvh/znC+HK3IUnUkHNfL+VnOSqkiIeVl346l
         kKGQes/OHVILJDhiU4PM8xFJvc7qKJSjtgcx2f7V+ygKmL2tVHBE4i2hEY1GeFeqvH8g
         JiSt89E+B3sj0wDSlsWqfuUTReAoF8ir7a8O2cn8y/N2rvYTkdEql0MyPvhRqzYl8tN4
         pwAGp2dVHWq2J98N6Ww3Nelz8yfOggLEDDJysKTw1pLajLXnoMiPQv4oMKGztLbPov5o
         7JmCF4cPqPB17gF8i0AFtC+aNnUre1nDscJKQJrJQwiiyfFamn//eGmlAb4IJ3P9psIA
         o+mA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779769058; x=1780373858; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        b=p7i8LjSIJPvTNPzz6di+cLCPAXTNGfktWK92qOPllEtFO2Y5eCq1FYhIIHvRoibZs1
         cSftm80D51sTSVRU/HUh/wyxsnN3teUQt0iFpD6f+R6qTJppNlm4j4iB9Fv8u1fRIvog
         ziomS5hAKe0fKs8kMT0TuDedvDRdQxrATXrovlAHXYeE0r+t0EdeVdRyWeqvzV+GT3EX
         mUIAbZPBCXaq+vr7Oi2IM3D4rKHVcpmf6SQViatsJF63/M+yah8l3p+RBGtpY2fVOq8J
         1QXs5wHPTFdGLGRjBszcEbmrGP/BwbnpgbLXLhnSkL+pfUsw8lF8XuuMsMQ6p7J03dHG
         xqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779769058; x=1780373858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjzT+YU+WzbbKcxJRdWZ4am57GNWqPjoWyeRr7PJJSQ=;
        b=QaJiTKr49TIj/Hdr5z6e7n4x1TAL+XzgyVpn9QCI5Jp585ZyOePCrgrc+QbJZRYu3o
         nm2SdEyBAN8xLTkp8299q0tELCiJtonLEtL7XIOlUJ8e3luJzAVx2hEB476/CTdBoBG7
         9UE9C5PIj8maxpVNHCbMOcv8piKfczKYPCQpp2BmrbIfuEuaPJ6MzNhnG97pz2kZ7rv5
         GhFXd2KXXbS3Df2I/lQg4JO55khfTyqeREI836K8Z/BOFx8ZRTholMIfecX80PdniwJ6
         BwuTQH69OwoOrgWcxrz1To2pqGa9W/3fLCkNXhZJDC4E+uGgu6RVPfZYNvxXw20z1cpG
         erJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nWSMk9QnpvwpWyYcVjrqS/sXZfdx1BU5EQVhrFIRLhT+gZMD2du6C/DZNcHLVBh8W+Pdd8v8DE9SiiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyX2sd38jS7RR5ekVM4oZb4IJ+p+s8TQiQDBOcPMK78FXBx2FHk
	ClGhgP5t4Nosu47yMnBN2avjAkanqBp2z0Er59FHIK/ZIKGzMC/C9Zb8FPZnmkKmoZhlx8xrt3n
	AawYCQmrabkLArRbQi9HJTCbf/fKo05A=
X-Gm-Gg: Acq92OHPEfxUGcj6sPgBxArokCaMDjEcCvyHIvYxNmWnZmojCDV+ivv8VaGLEpqfXIM
	XmMIP4PoWYpeMSc1TKZ0/z1oXI9ZBSzOK8vCKHDPoGKaC37mQC7ZN7fkFD+bsmh2ema4kJHZ/6z
	0r35MqteTNPreC9hYz6sM468dc7eK5txtzAXe6DRuSk9BHxR0orLR3s7YBpdGDXmacbXSpSqu69
	AppuKGZx3poTVZsyM0NeCZpgIbgzuXKTHgLVqNBar4FEaQOWei6CRMMOF9kZrnteWLewNOW646z
	KDxhD9nAd1nZQ02NecWEk+aEQ0sC0vDrsZrQAOwuOUozoisF
X-Received: by 2002:a17:902:ef11:b0:2bd:d7b5:83ed with SMTP id
 d9443c01a7336-2beb07001camr199500955ad.39.1779769058465; Mon, 25 May 2026
 21:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
 <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
 <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com> <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
In-Reply-To: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 26 May 2026 11:17:27 +0700
X-Gm-Features: AVHnY4KjIHp6k8PI6oQzPKSFMzC_yNK4NVye8enq3FNJPQ2UT-iy1gcG4S--peY
Message-ID: <CAABR9nHbwNheKRSzevSBnD+YyLeYVDA4FLH9AN8Fo1uX596rSQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Chen-yu,

> Oh, and you could also add that the resume order should (normally) be
> the reverse of the suspend order.

Thank you for the feedback and clarification.

I can certainly rewrite the commit message around the idea that the
resume ordering should normally mirror the suspend ordering.

However, I am still slightly unsure about which ordering should be
considered the preferred one in this case. If the reasoning is purely
based on suspend/resume symmetry, I wonder if changing the suspend
path itself to disable the APB clock before the SPDIF module clock
would be an option, which would then naturally lead to enabling the
SPDIF module clock first during resume.

From the hardware perspective, I originally assumed the APB clock acts
as the prerequisite for register access while the module clock mainly
drives the functional audio logic, which is why the "bus before module"
ordering initially seemed more intuitive to me.

So I would like to better understand which ordering is considered the
preferred model for the Sunxi audio blocks here: preserving the existing
suspend/resume symmetry, or enforcing the bus/module dependency ordering.

Thanks,
Phuc
