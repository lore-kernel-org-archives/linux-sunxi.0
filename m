Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB56A8004A
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710350304; cv=none; b=Sa+6h+ggqiuL5JCMDtIgK5jUgICOnJec4Nee1Ph0t/GVyoWnnGsixdq8++SlsFmqKbqSu2xnSDNC3DZ3oQtMJWeisaCNNcU6DGCgE8QCuxScU1qDx0y/jlbcGc73eFt/yv/XwKXOEd/CnBnxt/Awetq067XGcX2fGpKyi/4eW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710350304; c=relaxed/simple;
	bh=37T5IfVlw03ED4EzOqmPCpS1RhbW/FzcsvsNaz03OVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BBrxl14Ag8nHXZZndTlCTAiNPRB/9zt6Vrv6tv6G9ZymrJaW9aFF2qeSko4ztnjsmd3MxpOq9Ed9wtEV+uH2fq/6wBmmRaRwKsR9tdXIPKZXSvFQxFMekjroOhNoEBFYaonvTHw0UafaKfJvO8Y36Bx1+ESuK4PWOIW374n6sDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu+u5a7q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xu+u5a7q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-413e6a11280so718025e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 10:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710350301; x=1710955101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FqFnJvYNw9zpN3h/cMtu8tZOEqGdp7v63hXLyZmhw0=;
        b=Xu+u5a7qJrqwQB3d1whC6JFgCxafXXLshy/zg+7vPfQunmpCg1cbV85c2FO2UEkq/9
         /0O4Gil1Gzo1b2K9umOmaWbyObv54GqxA2l3qel3nJpEdDccyqgUbbazgUqWRHs0uAd4
         +F91YUjzq2Qv/Uu+GTurqZW/IlGNbrZVLKpROhtCQPzzWOgr1XQtr0dbp3gIFQ6E7sQl
         ir/M9QilGPqx3JfK59v4XN0uiX3NMn2MmlzF9Z23X69s21JH5REzGpXpXnNKIQz/m7rm
         kReOBwFH5KSHy0xXkoXcMsLqiTEqI4aP43dT2IEQWgZLgyNb+0vVYgY4EZDrIAwBW/xi
         EXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350301; x=1710955101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FqFnJvYNw9zpN3h/cMtu8tZOEqGdp7v63hXLyZmhw0=;
        b=KOU72LO3iCxOxuHEhEb2Eq+mgPEMYVqc/xZ2BsdmTVU3DVsLKp1FzyV6Bj+8YAUq8S
         kJTTrPukad3Jy/XLhMiCE/gGmfhhBrQFb7WcSNq9dR71V/1vfD9sBYrDPk8SZWj3/Drr
         mw2EL61iaPSBe5PqOZ756xtW1VwXfQntpUNLMss16wMK5nJ507eCQ1hf5cURLiBR4pkW
         ypirXimEItk9PuGMGWVUPoJ5F5BC0axh3lViSgFSWve14RXtIQC9IvmSccg7LmE1L09O
         cpnl2JPFdQainsCgQrITWdBV6N7j8rBu00yJzDJILaIA5gj/vwLeQ6qop+GU2/swe0wZ
         Hlzg==
X-Forwarded-Encrypted: i=1; AJvYcCWG9ZzfjswNWjqmpFzcZMRAC49yyywaws/OlPdph1HPZnDXM6Z9ZJGBBzrKp2m1V4ZcOvIRAQJ1FDgiRv896Yp9Yab6jM5KwG9l4B0=
X-Gm-Message-State: AOJu0Yz5L4npwkeZk3L7ABet8KofJ2uptCaSkWy+jTxnH/xvBAsvmBJP
	FNiUc8Kv1SLv6OMM+zEisJUBILeqAVTEQVaFvj4ulPY2z+JR/yiR
X-Google-Smtp-Source: AGHT+IEtiPdYkCDAPHchHeFYhHC/s2/7awajXKKfjSyC4rnwNuj2Got/IRTSQQF8SJ0Qx5cyNnpxUg==
X-Received: by 2002:a05:600c:3d17:b0:413:e85c:e5ea with SMTP id bh23-20020a05600c3d1700b00413e85ce5eamr469639wmb.0.1710350300980;
        Wed, 13 Mar 2024 10:18:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c4fcf00b004132ae838absm2833251wmq.43.2024.03.13.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:18:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] mfd: axp20x: add support for AXP717 PMIC
Date: Wed, 13 Mar 2024 18:18:19 +0100
Message-ID: <2315501.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20240310010211.28653-4-andre.przywara@arm.com>
References:
 <20240310010211.28653-1-andre.przywara@arm.com>
 <20240310010211.28653-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 10. marec 2024 ob 02:02:10 CET je Andre Przywara napisal(a):
> The AXP717a is a PMIC chip produced by X-Powers, it can be connected to
> an I2C or RSB bus.
> 
> It's a rather complete PMIC, with many regulators, interrupts, an ADC and
> battery charging functionality. It also offer USB type-C CC pin
> handling.
> 
> Describe the regmap and the MFD bits, along with the registers exposed
> via I2C or RSB. This covers the regulator, interrupts and power key
> devices for now.
> Advertise the device using the new compatible string.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


