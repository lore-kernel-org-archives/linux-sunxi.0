Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795001186;
	b=vFTTweMPUl4KRtv2C01vxR3079e2eNJfonKAi4AVY43HqPFZ92gM0Y9Od2DEDV9sLr1U
	 lWbkg58o/yNe1c8nkNedRkl/Qw2N246qpnVQJvF+mDbdCVbM05cwTjNMweSc5294kkaCt
	 Oa59uvEduhbEubaLiny76sYyi+DF0lHuG15hU8/KZuiL3kDdvMHRU2ofuk+c3jgPHcl4d
	 TTnkaIgCp/c+IJDfYLKG6MS3BoYHb4436iCmhGvXX158v+fCisAXO6XUfOzc46WmH5xTC
	 TNk1rSL9bDsq29mf2BjVSS1OdDqAtNiOhjOwpyy8dxtsigG6+8Kf16bBsL5GSHY2glQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iG85SNDM0ps1HyFDDprJwYmCfWp2zJHONxCJeo/IOfw=;
	b=WlU7nM9P7o6s4xuG0fbcoKGVuEOL6eKL0UnAM69kGhBgUMdWUwQKxOjB9Yf3cGmIb+fK
	 IR1RPaCgt4S5bXw763GosCCrQhDTuX6kCiz14FiJzHwfkLG2g4sf8GRFyrWpYi2jLpGy8
	 exxZUfb5vWMDtjBPHX8WjNHWIk5uRBbb19ILq55i9CP5zwqzSfYkWP4QWL3Cz4OXQBYn7
	 fwdBMa5Ttu33nNjhDNj+BXKNZDoGq2/GJt+oep0pNQS4/TtHw+Hx3OeULjm1YxYSAL9Ma
	 EW+FoUJ7dVomlY6FSGz9D79Ef4NTJ58xFdCPWpyaK/N/jrgqVt399RXSrVqbB8D2ifA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qp2FvE1g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A8606A31C
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 11:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA4A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qp2FvE1g
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4eab91bcaso5330017b3.2
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Nov 2026 03:26:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795001185; cv=none;
        d=google.com; s=arc-20260327;
        b=FIA1zldi+BLcipK0B0M3FBEXG2hd8DOGiDNg1mFPj+3dOwsDiAlQ4XixlDSCNzWGby
         bJqKEUiCMG4VhvC7AUYvOvYE0QlWB3smaZgYCfW4ODfYwswVh3oQA53joX7uQ534PCYh
         LnLh+tAgEDpVLS7EyhhIjBzsv82AyxIPwCpsio4CQecDLgn24y2BDl3G6J+52SDe515O
         DPkKS7Yru1i44mPGEbMDLjz8GyhjCWFhiYQFRTLeWSCI3PghfhNGKhEE2VxgWPXJ93bg
         vBTegA8HwEaHMadCdtsRvq877TM+Sh83ThIouoPa9TKchE4vNMaY+O7M7OMvqQnHFe91
         cDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iG85SNDM0ps1HyFDDprJwYmCfWp2zJHONxCJeo/IOfw=;
        fh=O4+ZCgb5giFz/U/CGEby7pYACKcVUkq6yOVFOEhFXfs=;
        b=EPczt5HQ8nnxQUuVZvgCnuNvwYbkyIxf5VJCp241Ec8RxznL50y+E3zOsZmWrnbpgv
         TmvofQeSU8PLY/jEvBzP3/pDw6mDB17EphLvypW5MYdeDSDBErzv8MPE3IuU9YA9Zfjb
         XSHv1t3jlRPS91VjgqXv2iuhh4MBaUAgTX69cdPeag/CfqyInElNCEbt8CqW/uc+2l/W
         +Pzx6HZyFwEW2u2lU4cmVlfZGwqqgFIbGVTx+xIIIpk+lgxiHT24+4bF+F86IB38Jqy3
         RoquA/DQRlhTt1H/5/6h1rdolG+idOh8fvxxyviyGPifmBxnPvih7ib68jEVXrJnvxvL
         M52A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001185; x=1795605985; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iG85SNDM0ps1HyFDDprJwYmCfWp2zJHONxCJeo/IOfw=;
        b=qp2FvE1gG3aA3Ecm9qnvw8pMtXwLID1w9GOgUTEHmd8cIn4wiRTcRoDtRc16gKWx5O
         17hZ2qM82Mth8P8bXusEB8s1XLxERLAFxLShEnOqtvxV/TesKmjfm2hiqY82DwOHI9HH
         ZSgGAuJ4QgnITKYKsEDovGo86XnugvlM/Eqm/Asw0sYYpUI6LMSxgfbuVvlGqk+CeYrR
         iE7YxBok73xb3Xj7Fh0rNRtr0c6BtUdM2xUVAZUQLrF6Hhc7AKfmehld/x4ZTNJ4WVP1
         9SAL6urTa9DwfrGthcU30oqFcRUrJW+Zg6ZIzS5JqiSRpvb37tE6FeAhMVXSk3aTmnQt
         Pa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001185; x=1795605985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iG85SNDM0ps1HyFDDprJwYmCfWp2zJHONxCJeo/IOfw=;
        b=0B8hMVT6s8KGi9tQ3YDdeTruirYFDBbQtt9Wd/3QxDPR3ofRGuuHYaZaHAp2T244+8
         ZS4nVB7f8rtLLArnclZmYscM4oTP6sxhpL6eMi3IxCiK6DS66Q7jlytUsNFXeK+xP4hx
         LTjQplTE4DuZGI9EpSWQjw3bAHO3/nwXTyB0e5WcycZeaA0EadqJyYTcSLkic2rJ8jHg
         g6T2VO5Xs8duJtdXkME8TsABIePyRr4VvpsDSUi1ddEXbzkufgXFxKxb+Wp7bP6Hi4EC
         VAXvTWpa7x28DUsbfINX2Dd5wiS+mQsFalZwn3tBaiAekLoFZbhSpAO59QurDA6u5Lw1
         N61A==
X-Forwarded-Encrypted: i=1; AL+hErFabz8wx+FoAYU1YaSHGzH/le3XQxE9ZAAt6wxljiEi3b9yWBYIRt/RkoFPeojvRlItKltU6dEe7CInzw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/d9ZFQYTUQQ4r7z8kA0ZMFL04IKCVIRxJxL2NsJzFJQP2e1vJZ
	0/MyrMLinWrJHdy8i5ykZ0Jhcalp0G+C/5bpqBc0RcIspnJCEFO99+Vpz4IvKlTH0HxCmW7cbz/
	leS4cOiAXUxSy9+kpBGora9ITZYf8Vw==
X-Gm-Gg: AZFdTZdtpcY2q/niz9ojzTf2Iz+3poG93UdzSenNy+RXo8I/TUIgatbAuaYvmdd4oD3
	RowvVu8RQ87P7xwxyKAL/QLz7iz6bw+gHrp2jJiFeHncrXuZOxwXzxIllPtCOPDnU/PYL3rennk
	8mR50NTaBS5gp52G11xI8TZMud1f9ibCqVfga7DuY4hVMrKd50vkJWO2Bu+VGvuI8bipmOFb3Fx
	u9Iqv8N3voIs6Gh0yWRcZFzV+n3zxVrVeFGygHSxV7neME6gXZiywz5jhZTTBwMm/d0PsFfyWJ7
	9bAQCLCd9ehbR5ZC7yOCDJ+TqPArWJSjSrzNB0K/nLD3pR0PvxGft3uU+x6MUIOc6siqBk8PeMq
	oZ7bMRMGc8mZC2P5IkZXiPVeFg99eA+1dfbyyKccr4prWaXbEDXsTCIByqHBKOVuzpHRo2N6UNG
	KqNWo62pj05Cqw52U=
X-Received: by 2002:a05:690e:13ca:b0:67c:1d44:7893 with SMTP id
 956f58d0204a3-67dd3d4f880mr946609d50.9.1795001184619; Wed, 18 Nov 2026
 03:26:24 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
 <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com> <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
In-Reply-To: <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Wed, 18 Nov 2026 05:26:11 -0600
X-Gm-Features: AclHuK86IGfjb-tJSBkHRXvLYLp8mX0o6ZH0YK-0e9q07g7-KmQTpFPE6-EP4x8
Message-ID: <CANxy8yTA7Nqmggk=qn7tCnXn50vS2ceHdZYZC0_OancmZhnKcg@mail.gmail.com>
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP table
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

A short follow-up on this. v2 of the OPP series is out now [1], so the
K5C DT can use the A133 OPP table.

Do you already have a K5C DT, or plans for one? If so, I am happy to
test and review yours on my board (PCB V1.3) instead.

If not, I would send mine as an RFC in about two weeks, with you in Cc.
It passes dtbs_check against 7.4-rc1 apart from the missing board
binding and "kickpi" vendor prefix. Some regulators are still open,
because I do not have the schematic: which AXP803 rails the board
really uses, and whether USB0 VBUS is switched by the PMIC. If you have
the schematic, or know KickPi's registered company name for the vendor
prefix, that would help.

[1] https://lore.kernel.org/all/20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com/

Thanks,
Rajan
