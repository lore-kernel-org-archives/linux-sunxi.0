Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E91184524
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332374; cv=none; b=SO7ItoaS+rvIJVZBZQEhj+isOHaPsoaOI4heAv/DOy2MOgJG2Wi5/wEQQOZcl9ParijyJpMCQ46/kgYvnBoYyI2zBbCDyLNaiqjykcDQ8TOfWpUmMS1k9WqlCyb6V96DkCRFZJ4b/dWLkVGf8l65s3om7+8QrT1P+bJF6JhXv7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332374; c=relaxed/simple;
	bh=Ktfr7SJQpTbgMhZZT/6XJflt14sbq+igmEnRrXK6oIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a999o03EokHwWvmcWJzYlhNXxNq1g/7kyWbRDsFrpvIC50ylUXTOwmTwvDZgn7uKHNwNFtlFsXI/hlLJsvRaEZ3gUcZhZabtrazZC6veZ9YvbLmTkodJ0H97fknDOq/TjPWzauiREiZmllK9Bgf5LGpnjzBwfP2kZAuKFCygx/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCEXeuHv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCEXeuHv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47a8195e515so23131585e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Dec 2025 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766332371; x=1766937171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktfr7SJQpTbgMhZZT/6XJflt14sbq+igmEnRrXK6oIQ=;
        b=TCEXeuHvgozUGQoN/qYGAkRQ99/MYNbw27+p/lLZ3XD8Ykk2cdBmaGfs4NhZuxmUaQ
         2n1jQsa+x4/DlxqvnyIiPN5QPTpAS+x0g/9F5/bWQbQWDcSkzpiaOxb/P2LdndvtiolV
         DGsJZSYIxus2fXFcfNblgcla5TG/Zz3DGTz+BmOKMgLVBX83DNQiNNSQivZcE5G8A9QW
         f3cUNF9x5Sue/BgVHGjyLrYukcje6QpV6H0SXWLAHP65ysCRtqExhH5IVADDprEuVsTk
         JZgUOFYCu1yG4INqwHq2cQGpoLkDzAyyVQ5vEjRlhe1TgjuBceqLn/MA1DyG/WXhgAFc
         EUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766332371; x=1766937171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ktfr7SJQpTbgMhZZT/6XJflt14sbq+igmEnRrXK6oIQ=;
        b=JEdHC1TefsGQOtau/E2HsBxDy+RGc+DtWjsuK3vCJ5szaNL1gwg3fb/LF5blWo6/8i
         Fi4YLK68T3EsNtFRVo3D7FuI+rQxJW0Gtr+XGmkwtFXuyUgAZpbbBF2mywN0jlCzcPrc
         yxiLQ0WvG71L/WYfBV4m92faHjvmE9AiSgsnG+NYpZ+W9u7fncpQJqRH1mfdMUgZmwkn
         Kp3JD1sbuooZXmJ1pW2zYcSLdqyofjmZFp8aCjOX8skTItPDkKks7Iu7PUtUgST0BwvJ
         9A1qcWNI13bdU6w9N9eJevUhU6OaXkuuvITIUgFROFeqxMhu7Lwxh5Ikh5S29D97mkW5
         hC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdTkenYgZY1wfiEdOCekgL1CcTfoFBJ3YMsBRXR8ClSuhtKYpRQaW0JrzS762xaAcrk9OeKs3zW8bf9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCGNMwjLsO+HlvdmqvqVVOSY8MIi6WTuUaqWzy41baR8ASJhrM
	5t5PnVDPSAEpv83byWcXvK+tFBoJqDslTwsj8HoBUloEubNHqZ+rUZ9m
X-Gm-Gg: AY/fxX4gmdKrXJwrtsgQ4a9UR00s1g7MYd97T/XIv26ugju5eBds+RJYvE7BlatG/Fa
	Da3nRrJ7VpjRdwQUkzanrqLivzFKnPTdDwitLkVoF0KVJ5etREFfTobLPDm8/mON1ABbtcskinh
	JUut9I7yFg2WaBC+Q0L2Pc4PPROnb1wdJyvfuN2hlCq+gu/HWUawSC7SoTNbGfZ449w6ru3pLuq
	jvQbBzsCC8srEoa89Vpvg2uw/1r3FUU0vwIp4KqA5IMLYYafVN3rZJ5mckS8C7VDhymuAAp634M
	aMfSsErgFyWOW67G7B2Lk8nhp+VJOYTooQ339xBZt6V9rFUx4lhaHWQtT+TvGkOhky4wsRFfIjv
	xQXMeRNCUblyTCWU/BIvmkwFwzuL5eMoUESRSwxlEqVC5AW5IPh3MGcGIZ4Zn7FYm3z1IR/K92+
	JTznUAsPQTdBTzK0m2vev3SqQnLv/A+PHGssJarTEbVZwghKrz44n50gFHsvKNN1/rN29o
X-Google-Smtp-Source: AGHT+IEbJh6QEEBqVoiA8uGAKHnpKaENlX2JGObti1D5zf3tJMVvd1glLOCkUq93fMJj0p1hdC0a4g==
X-Received: by 2002:a05:600c:45c8:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47d195558bemr85515255e9.11.1766332371058;
        Sun, 21 Dec 2025 07:52:51 -0800 (PST)
Received: from jernej-laptop.localnet (82-192-45-213.dynamic.telemach.net. [82.192.45.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a0fb9asm81695155e9.2.2025.12.21.07.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:52:50 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/4] arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR
 flash
Date: Sun, 21 Dec 2025 16:52:49 +0100
Message-ID: <13909614.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251221110513.1850535-5-wens@kernel.org>
References:
 <20251221110513.1850535-1-wens@kernel.org>
 <20251221110513.1850535-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 21. december 2025 ob 12:05:11 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> The Orangepi 4A has a SPI-NOR flash connected to spi0 on the PC pins.
> The HOLD and WP pins are not connected, and are instead pulled up by the
> supply rail.
>=20
> Enable spi0 and add a device node for the SPI-NOR flash.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


