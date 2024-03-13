Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFFD61687
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710350069; cv=none; b=CZjf8GgwH5D9uv3hb7iJVAyohyV2Spl4xXjCQK9SaJAedpngMdep4E8YH7Ok7vTrkxkz0auiqx+wpqMVfvQHsr4ogE5LjgpsYXsH1yNi3cBw2AU5QgEMiXhzWRiQH3qfXHsHEtKC2KqRtYEqwixc9ACSZMF7qbQxV/3Fz8Le9Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710350069; c=relaxed/simple;
	bh=2OTaIjGgDXofJxx9Ee7lWxiDlWCxWOuc2nGuNlCC90s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kwFZ7yzVZpjXiXFHD5Uued6ozEq4hiqlAUIJpG5Tcy4c85iYsQQFcyz5K6PUz5JQG9Z0JWZBPo6GXumPIif/0LEPbd1ItaNcvAN++62YZsRVpWNCQ4n1MAn1q0wcacFLRgWq7pKWHjcNqo6GCPbc1B0do/fnYWtldY9qr7ElLW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpyenLFI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpyenLFI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33e7ae72312so8500f8f.1
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710350066; x=1710954866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3lVNzpe3EGPa9RLkujrZt87SIOXgz2iKMU/KVgYcOI=;
        b=IpyenLFIhdGlvTi72N91aNG6f9arMSSsfle7qELLEvb1xqK6w8qCM22+5/32QoyCPC
         cGvsoUc2MLIuTxycLUNzSX9f1F5cLuqPDTTDYgI4oiLDvwJzfHzLHnOqrJMw+6WrbWK7
         VfVOsumwsWQ/XtudbLQqHD8zjswQYNmoX01JRsLvv1XzoBmh2KTAyg8Wh6hyVdlGhgT9
         fX23FnHPl/h7SSp6Bqmw6dca0JqUKlbkufFdgQLckl7bLeLa7MOenSb4TNn0Xp2XM4/6
         56PMZjrb5wV4vPoC5kjeLlCTvIOSihDMt1CEmIHYFW+FQgQY4wSDbDcYY0HsCvDLtdy6
         UIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350066; x=1710954866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3lVNzpe3EGPa9RLkujrZt87SIOXgz2iKMU/KVgYcOI=;
        b=BhH5w3X8YgqKr4knkXrDuk/G3lzz1W1uFpgBaY3rktTd9TQa4q11Ci8HKZOgLO2pAs
         41ZcY+VoBTJ3vlKBNBkV+mkY5gLkTNOmu1UExt1AOq5hcHPdi6eSkmmH8h0717wlCJCu
         2xsPmTW8EsxzTyyv43BicJ2iJxn6stDaDSRwRodhqNrk1g80qNddiC1Cr24mHhdrwKPI
         qTlcYPjXmwgTdALzipi1ksCkEgBIQQrMFTFMDoQBt9wUpFFj3uQAOCgUAAi4BAEsGkvs
         QVcUgWaV0+GH41sI3R6jdoNGy2F24xmGtAqqjxC56NEjemofEINa9pONnDyUkZEWPn1V
         pyVA==
X-Forwarded-Encrypted: i=1; AJvYcCWpk7hd0adb8VsVKRynpnEzcZ/KYsgT1TXj/Iw3gzGJ7rbKWs7Y9+OXFAoWTMz9zoQZ7fF6XX/UBbs6EpZO0jg04EHyrBiP5qThb8Y=
X-Gm-Message-State: AOJu0YzXpNAxrhhuyN3SqAn1xQlBJw1Zx1zsPILyxOQe+tl33VLW2jHB
	E6z2QaKHm+UQ9OK/AIpyK3SLtK8o4VpsPfcGfmV+p4nUKSfjrrTi
X-Google-Smtp-Source: AGHT+IFVxS4gydSuP1Why/aTVAez1v+HgruO0HqIkhk62OgdvkGZMiY8ntdvY9LKbTc01gQlr8KBrw==
X-Received: by 2002:a5d:5285:0:b0:33e:b719:8bee with SMTP id c5-20020a5d5285000000b0033eb7198beemr1419837wrv.53.1710350066163;
        Wed, 13 Mar 2024 10:14:26 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ba14-20020a0560001c0e00b0033e96fe9479sm8318396wrb.89.2024.03.13.10.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:14:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] regulator: axp20x: fix typo-ed identifier
Date: Wed, 13 Mar 2024 18:14:23 +0100
Message-ID: <4901806.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20240310010211.28653-2-andre.przywara@arm.com>
References:
 <20240310010211.28653-1-andre.przywara@arm.com>
 <20240310010211.28653-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 10. marec 2024 ob 02:02:08 CET je Andre Przywara napisal(a):
> The registers to set the X-Powers AXP313 regulators are of course
> "CONTROL" registers, not "CONRTOL" ones.
> 
> Fix the typo in the header file and in its users. No functional change.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


