Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4137389452
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997894; cv=none; b=MUmk11D2xFiPW6MUR6/twp3gg3cECAXyXShLBX1gtn/BmuDHUKdDGZk7Jt79i3y7PJLGZxGjuTM++ft5IhdIOFCpKyz7NFLHFK/o8kX/nElmL5LcHZW26BnJh76b9sRrbyB+usxFU2a8VjoxbDwuEEj1cq5GyOZZkPmAiphjcIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997894; c=relaxed/simple;
	bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBtz5iSokh5OeLuKjIO2vPf11L/BLj6lEXMLR7/wf/Ivs4UIZnWugOcC3qTJ1wqcRHq5Fby354B/f3ZHxEs4AVPaX5xUBpYBqwX/kC/B7aJGkTteg7J05KUZCEPDVNlWoQo7NBIHAIlgXWMIPP1CTDQcFbkPmN+Ahl1rkDg8C38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ04sFVw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ04sFVw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so4167768f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997891; x=1778602691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=jZ04sFVwplLS2FTjpipjcSIu31Se6U4FiIAP7dQQ1uFoy43r+3/cQVGNjkIkifsj7J
         W7tY4vFEc629qqRTl6FxHXjZGgIBEia/N8KVOLutIuL5sg4WeM/CrjrNQP3nnJx0bku9
         T+TWlVAKMrJWdEduNZ/JN50tXFXatX1UA2o3EMLnFvZ3gcZrnayPr7goveD28l4JsjN5
         Q5pPnkWQ+7p6sAzFQ1aMiOenTFSMXFcT3phqqpZQwpSfvJeJYEYmcDhSsaEpi0Be61Dc
         jAkiPzmEnT7O/8/u9L4EOjQpI9QqqWfVCVi4JPMLGuHX7v9xiD1inREaF9IxN1VuoKxG
         tJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997891; x=1778602691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pHCtfjeFxc5IrqY9Ylg8aIPRx+nL79BtlDjjquddJdg=;
        b=NmplcUo/Ul92SD/JbjEdNkIx7PuBVY8N0y+gAtgRgNsNqAdIF/yUeX4dz6bpy8tm6r
         HYwMkwpHAKzXECWCNEFs67yaHhn8uX7m6kSUFKYCF/M6NX5xrNA7QMyX8dVGMUhJyzpc
         b7gH6LiGBFBuM2Dmcb4mHXE8bH39QWr2A7M0qLRNkYJWlc1ygV5sRlNnFkTIIuTsM/2f
         Bo62VqvGee21qZcsALY0Hqk+ec4QAlJk1+6LPOrLXfQOvDEQS+11/ioFk7xJG2ar8/Bc
         zUdjd1h9olWc82VvWmgT4uCUynKyuwkTKiaA1uEU0idfLvtQReicI4SBZTWgbow9Qbxo
         x0Yw==
X-Forwarded-Encrypted: i=1; AFNElJ/0J1CllOrMWkuAtKtaV6HI0Djf68rIXaXRZoF+ysseTg6hATtSV/YjZNREzrFUYIsXCBmTZuE9AT+F1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzP5aJtA9KJ6TnwyTWHojYywiIQm0qNqOUNXRuAy/HxNXh1Kmek
	mKsisi9GYyVCGwa/K08OyAfZ0UhcQA5Aql1yUuP1S5rQAxFb5BoJZBjf
X-Gm-Gg: AeBDiesL1SXQeuH8/KEMTENqrcXSTIjlHgA0juy1fqtLRvGb3SzAzn49Z4Kzsto07G2
	bYjB21E+5XjaFfvl/ihIodoiwxDiCHyQXaXl6IYaNVEmPEzNd2Kr8g6mEKqsKFkGZMzJeNgANRl
	dqVxknAs+T4upaBwf+iSQBLQNZGmKoFf/51I90zvymHQGSQBE8s+PZaExvxFjx9lsw+2FaHTx3T
	+lk5rF44Ycnl4SxGRsqDePJmJIdgL5Qmce8adk1yHGPlRjlzHylTzJCj99LM3W67p3ANydCOslc
	TGtn1KYXepNyd/a6XnhikDREJPNeqAgzU7/g6wck1/3nexo391Tz0BUDWY1iqsmsPa3376EkdHQ
	vGrLePkc5QFXkNNj0iLLO4wyOK/nAUl9U0cuXs+qgb+YViwn+t6qd//cuEK/pglMOySJDOIJ71o
	aKST80vm48LCBOWrkeQek3P18/F0mDNJfwn9kRHB+pIA2h4Bypej8lp5oqGXv/F0n9nOQXgb5AS
	Hel55ub1ehZenzH5cJrEfIerhkj
X-Received: by 2002:a05:6000:2dc8:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-44bb2f282f4mr25038895f8f.9.1777997890976;
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505558e213sm5821604f8f.25.2026.05.05.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:18:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/7] drivers: staging: media: sunxi: cedrus: add H616 variant
Date: Tue, 05 May 2026 18:18:08 +0200
Message-ID: <JyKk48uGRMGhs1Z-wzq5pA@gmail.com>
In-Reply-To: <20260505134812.408316-5-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:08 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> The Allwinner H616 SoC has a video engine hardware block like the one
> found on previous generations such as the H6. In addition to the
> currently supported features of the H6, it is also supposed to include

Remove "supposed".

> a VP9 decoder. However software support for this is currently missing
> and still needs to be reverse engineered from the vendor BSP.
>=20
> Add the compatible for the H616 variant, using the H6 variant data.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


