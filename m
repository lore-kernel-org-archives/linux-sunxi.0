Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF43A8756
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Sep 2026 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118927; cv=none; b=pPIJ2Jf+67NxfCCNb6zz1h2XYH044NSYZGp3PeOkF5FqIN1sR0M2lBMMgzgY5ziSYKHN8UVLinrmmR2STgpZ3COdypuEK8ghsA3uk/DOYrm4mArofrTtHLnzVKR/9HEVOJGC0D/Lkm62HWryIHPKZW/3yv3i/jNtUINAtAy6kaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118927; c=relaxed/simple;
	bh=6SidIVM2VhXxSqtPqbCE9i/tqnPHI8JtRxVo4q8INdY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IdEXA/HDzpLFRUXw/RjEJqxeJnIL6pB02kT/ehzC5xGq1J8+hqaJkTAhp4mPKf2NQImtT3Vw4GPAxrFltIG9cpynn9DGZg3x/xYIEdyDx3LKLaNmwCGY+bgbQUcKjnHinUf+bDgsyqRa2ITGhd5L3XseF8KF0W2syxeIV/Z8iJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iBpUl3JY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iBpUl3JY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso6952745e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Sep 2026 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789118923; x=1789723723; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQwqbXwJzJUEnBnzBsi0ka1PwipDEMcTOXIfYajspX8=;
        b=iBpUl3JY49rbhzgElEk/h42ycmVVBd2mmgr84Bt56RcyMAIQjS9AK/ibFm+e6LylIY
         rUeX0LtxlliBfqDl+Epw0mWZHKbjUxDe+z41UiUzMHoNap5jVKh0ZpDqdgOoN8EX5z6H
         2zLR6P0dsUQsSutIOqn7G7nhQCzfOqlojPI0uyJlZLsCM0HYNGWSPt8mbClE9aGFdJdP
         Vwok5IzH8lN49SHaWJvC64kKtjpn8dQT/EIm78lqtXNA5ZNoTECUIfyGMZOuc7zhYhxl
         uay+FiXNEsJ0vjIDjerPAh4gs8ML03717Nt+bYtTkmxd8AnSwHVgvBavXjtW3zIlWjom
         ry2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118923; x=1789723723;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQwqbXwJzJUEnBnzBsi0ka1PwipDEMcTOXIfYajspX8=;
        b=NwcYrXD7DWqXTouKmUTiOgx0qL2jp+CsJExMXnj+A3WsxTV6h54DYheKOtnfhh9Acl
         4A7zKrvzuaWeoTEgizS8HfJ+wK3vuR/mlDWXAR8t1G3+fANBz5z56rJoSIrCVaYxAa3X
         FvjH6XrADlhhxRcmrg2qkS33NUpK8wAEYdVrngOcdCvizV4r59Nk6V6ouymSlH2LjgAq
         NLb++MqyQEsnTDIVtJTblOMO4/D2g9KWbxIFxp2W9FKrCkj0N3V1q94fKSjvaa1xARV9
         oQJDL9OqlUUpYsqWJr2qZXjhku9dvLhUyyEa23NKEWZjrOZLiDHNCv2sHniw0TB1E8kD
         RC5w==
X-Forwarded-Encrypted: i=1; AKwUvBzwkB/1Iiso6gEELndAjqn3A5McJrVcPglXttjuT4HPryEB86zMiKXmwOwWQf4SI1NzUkhEiaDSRSYgpA==@lists.linux.dev
X-Gm-Message-State: AFuF++ledu2gUFljyVqNdRNoK5A1B8v0gOfMLXYShkWtDJIAUNM0v5Br
	Fw/vJMlPdOWbAz50l8waHLhbHTgnWCsiYvwHxZLzMhONwQCZU6CvdhhtjN87Jy53OzV97t3QOPr
	peuRW+CY=
X-Gm-Gg: AYBFou2IpNKF9mwg6neR7snGS3jG725kofQbc/oqQBO9ZX6xFHEcvDCT3+D8llKEZ24
	ViCHTKAOcgyQiB4S2J+UIrHdC9IhCiGWdOCDBnbu1VVitJZDGBZ16GV+SKRvlWcD9rgd7lclnN0
	kcbNLYSdHJGliaXt2NA+Us6Ja9X+QA5hx4+niL5Eul/K0d/iGlwtHwoDZ6daQBfNtHfNmP28lli
	ZkrZfiJsctyHdCv+WCWOhVY0U5RB3epwhY5/jeeAq4HGotLSvH9l5hOHNAeUqN6MIRA6iXRCcUd
	AbiNXfcbpUsfTCPr6lAr82ZvZE2XNZ4PtmQBc7RwzRbV384MOkYAEqF7bxaw6k52cHwUtjugVYi
	CoEEIQ6aVP4X5HxSGCOn89vc7X8CK9gNLtmseVip6O3w0lXhRtt3Ck+VixbJgQN/gDyMAeQeqti
	DLrX/JiNsRzwcTLFHt+Yf+AgrXo52k6IeWWlugUoXDlfhND2+IEk/1Alr4mrnOANvgFu64o2oOx
	uSFek+6l9BWx6GXxex8GhDsFn5w
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr44117805e9.20.1789118922855;
        Fri, 11 Sep 2026 02:28:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm83052575e9.4.2026.09.11.02.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:28:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Enzo Adriano via B4 Relay
 <devnull+enzo.adriano.code.gmail.com@kernel.org>
Cc: enzo.adriano.code@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Ulf
 Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: add Allwinner A733 SoC
In-Reply-To: <20260911001805.0a2e033d@ryzen.lan>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-3-7787c94681db@gmail.com>
 <20260911001805.0a2e033d@ryzen.lan>
Date: Fri, 11 Sep 2026 11:28:36 +0200
Message-ID: <1jo6e46ssb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 11 sept. 2026 at 00:18, Andre Przywara <andre.przywara@arm.com> wrote:

> And what about I2C? We would need that for the AXP PMIC. Having that in
> the initial DT is required to keep the DTBs compatible with older/stable
> kernels later on.
>
> And it seems like the whole r_ side is missing, even those we should
> have bindings for those. At least r_pio and r_ccu would be needed, plus
> r_i2c.

I have sent the i2c binding but it did get picked up.

https://lore.kernel.org/all/20260707-allwinner-a733-i2c-compatible-v1-1-566340542bdd@baylibre.com/

It is a marvell ip and I used b4 to send the change. I did not notice
until now that the sunxi list was not Cced. I'll re-sent it

>
> Cheers,
> Andre
>
>> +	};
>> +};
>> 
>

-- 
Jerome
