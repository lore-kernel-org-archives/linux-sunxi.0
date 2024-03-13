Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017A462A18
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 17:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710350718; cv=none; b=fy3+Xyx4ERc/yV3oiX75lpXYTfquifCUOyQjasd/qU8aktxTW1TClZF1J4pweLxshqVFYWD2GEEansMMa+z0ITK2/HB0fitxJ/ON75HNX0+HUFJ9N++F5oCVIYg3LO6uDBf0Jw2BVxCe/2XJlVi+RshXh7I3XDRNyc1blmdQz+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710350718; c=relaxed/simple;
	bh=Y5NMiXCNqiFRfPflfL5uuISKnOFiSCta4XR8Oj1+nV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyb8lBfnX9LPxmCxLiq8TwPxp7DCU+kNkvAW7EQTSynS0smag1Qcbl5OYn2iMf2lV3e1ngAjcbXeHlRaRYxAzV0LcA6+rra6g/4GwMSyZA9Wb7/RSdwdJstN7T4dy+exb5Ld6SQ8iTylrsafltmUJerXwMz3sPENu0jU7VYXF+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYEQCHeG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYEQCHeG"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-413e61525c2so655895e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 10:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710350715; x=1710955515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWMI56CTn/B1wLp6f0Wjl+6QbA6cu6N5djRrOJhMpLY=;
        b=RYEQCHeGePdcGSE4rsMf/tyR8B5s2qSMFumS6Sa73m8Bx62wG+CltB1Ar6dOmzhJMA
         AMXjha3OTJbxTT4AtYT77WGtZqWd2c7V+uARScjEucNkvUUbLvHq7jK79jWZW9CmdgHO
         V7vjgdSfSbmb/WzT17S8eLI0dSOMIHy+tSoehQmq4/pXJSMio3XeBgBDfXHNT5cNkFMQ
         d5j07HQRxJAy7/t+Sq49fpqCMdYt3yS2AK6ZjDUJu/6wLUCvd/pozrMsfM5J9qUT3TL1
         5e2Y5gJL4csXdw+iomU5P0cOzdQ89mGUacFcXIaZF0gJ1kHXqFLlcwJ6jMpEtAUvLvG7
         pd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350715; x=1710955515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWMI56CTn/B1wLp6f0Wjl+6QbA6cu6N5djRrOJhMpLY=;
        b=JlL2i6R4qrqosEP/u0Exm0iazcfYoS3eJ77gLJAJsYIcOuwPSKZiVeehnj0fDpig/R
         npF1Oky77eO0fplCTyKlqgT0fIBI5rsUco7P8MZv7omoBMQEzzG6GE0cY7l17gpIcf5C
         iWpjr9ig6rNzfMtMYASdgeGFf2mExiruG1Z09OrrbzfOJZfemMurHokWpCAPaQDf0gwI
         9PDzsgact4l3M6IqYK4dK3500pIWmfUd7B7Di5KG3XFHGN5CkFwVvPYlHiQigp73cqk2
         ZH19cI5fDWzse1rRbrsqDCg72Fi/HTfnQL6EJJeDLnYN12lLg72CfKK8/7lcM4KnaU4X
         SS4A==
X-Forwarded-Encrypted: i=1; AJvYcCUZAzz8QGyMdoMIKAZNDHKhXa4TMOjFWHBRH02bXEKx3I8znLOnOscwa32QM1EjRKpkqnwxGNdJ4+kE/0GUDPV8Z/0XOL8iQ1ipxw0=
X-Gm-Message-State: AOJu0Yz/FzqgPj/JLmSepcSRJ6f7kUjquchVfX4yd6x6RaZE7wPEnzVL
	0ciIkvPFzmw75rWdg9BWEMVmHOIi6QR2MXTUI46aiZvqsK1CmQpk
X-Google-Smtp-Source: AGHT+IH97oa72lbT+W+7ZrB6GCBOnlh/O84pQQTmPaiJYnAt8o/mxhgSmXf9cmpsw5cu0296jg13Kg==
X-Received: by 2002:a05:600c:4f0c:b0:413:e531:5a47 with SMTP id l12-20020a05600c4f0c00b00413e5315a47mr495047wmq.4.1710350715199;
        Wed, 13 Mar 2024 10:25:15 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id fl21-20020a05600c0b9500b00413320f795fsm2924456wmb.35.2024.03.13.10.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:25:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org, samuel@sholland.org, Kamil Kasperski <ressetkk@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Kamil Kasperski <ressetkk@gmail.com>
Subject: Re: [PATCH 0/3] dts: arm64: sunxi: add initial support for t95 tv box
Date: Wed, 13 Mar 2024 18:25:14 +0100
Message-ID: <13468418.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20240311174750.6428-1-ressetkk@gmail.com>
References: <20240311174750.6428-1-ressetkk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Kamil!

Dne ponedeljek, 11. marec 2024 ob 18:47:47 CET je Kamil Kasperski napisal(a):
> T95 is a most commonly known for being a box with a pre-installed malware.
> It uses Allwinner H616 and comes with eMMC and DDR3 memory.
> This device comes with two versions - one with AXP305 PMIC and another with AXP313 PMIC.

I have this board and it always felt like a clone of X96 Mate, which is
already supported in kernel, except for broken sd card detection. Would it
make sense to unify those two boards and just overwrite or update parts here
that are not the same?

Best regards,
Jernej

> 
> Kamil Kasperski (3):
>   dt-bindings: vendor-prefixes: sunxi: add T95 to vendor-prefixes
>   dt-bindings: arm: sunxi: add t95 compatible string to list of known
>     boards
>   dts: arm64: sunxi: add initial support for T95 AXP313 tv box
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h616-t95-axp313.dts  | 138 ++++++++++++++++++
>  4 files changed, 146 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-t95-axp313.dts
> 
> 




