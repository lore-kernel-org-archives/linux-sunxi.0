Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8372566F2
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178024; cv=none; b=gyLDbyuZ5uksFkD8Bx9B772aMkm6maCMrRy8XpZ7MiAZDcVB72G7TeYFb5SB/2AjsIUnHr3Pe2u92JiIpNBkYsiIurNaP2UizeYU9WnBA9ZSuOgNfKyb9CPAd2ho8dUXw9RBFS0y9Wh0Oa2pNExDbqY9Oj8cBwQwBmj0RkgIx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178024; c=relaxed/simple;
	bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqNFE6fUdGhjaB1wKbYCseaN9sjlr8tP0ZZBxBGkMHtHau/7TlrglRXWjY2Pz71y8Ph5qQH0ZGzh5uETtBrlrIPvZLGscCSMKcLnjelIXar6SWabDYC/a8JcQAGGIovm9jZPbsfbllw03AyUivKlelNdO+KsPS0Ij/9bjlnQuns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OaayvvqW; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OaayvvqW"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so520279566b.0
        for <linux-sunxi@lists.linux.dev>; Sat, 11 Oct 2025 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178017; x=1760782817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=;
        b=OaayvvqWa48Gs8FgTNcUtV+rGQ+xLxc0Tkpmkeck+Dtgvob4MvDX8fg4xJro6rsZCc
         mY3Ci3cP9KYDIo09aGVZu219J6cSQDquNyQIjq+e7HwHQ7rCOgjMJu8FP29veK2fp754
         bxlFOWy34LQ24SJ/edXO+Q2k6kP7m1emPWd4JYpPgeToBs5ezhkNfTP9LfitJFZ4NY9F
         15Apnfl9/ukgW+t/VFkkTkhEXX1HsPYE6IE65YE/fvXt8LMUguc+SqphmZP6sVucx1i0
         oVssuxx644Wtp0q+fs1TVkm9DMo8//it7B9SvCFD/3ETGDdO1XT56WPtgK75uwqSsFxZ
         5yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178017; x=1760782817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kH6m3q9Go+WlNJw/7g8dG1h/aaEJpSAxzZprEUvs9Nc=;
        b=PHL19+9o/xzH69rb7WuoRpS385Jf68UqXHk4WWSLpjuwdUN36qbMrNea1dkiPOQzaV
         I8r7smtOMg5DQ81A++IFmRMw20noQehcj+MTmSLB0W0tem/vhyNtFLC0IKvxIgYVgWmO
         SvFXUBVNnEHJUuV1IhTnqeL3k1yaWV+tVhkm5ufwcGYNajR2U/UwNNJRugP/nr1EtNMe
         EOMMtYlz0V1e1W5aXLF60opT5NkUJi9Zs1JHA/WENpU2u/rdrRYmoIXRTV3wih0HiWk1
         MGiqCiF6J2acw4O9MULqQICk4uz21csVwdpm/U0oWJb9Jsk17zr0k4Gq9pgcOZi60VC5
         nfDA==
X-Forwarded-Encrypted: i=1; AJvYcCU338BjoMCBjsotL3V0/fXkMM04Jdl/UeHOQm/bir3mBWxT9qFvowPzAfWJyUB2x010XM708H+xoqO4WA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhezIzpWOdY1LhbAUi7lbPZMVLC8KWESaxukwXeqW97Ms8k7d4
	9GBPEtAcw8nJARvpjSURdB9Yaq1j55gokz7aeCbn4ijr0ixHSJxGL1LB
X-Gm-Gg: ASbGncuksYZfVJVcNC+hmgKAlZL/Laa0dq5umILCKBLnPHIlXoQhlmM0Y/JWYFe/quH
	o3KCBboAB6VJzikIoAYep63FKKLM/DiSMZWu8i5wE5OsbAk1O6GG5mskPh5PCdMzAbLbbxHyfwM
	1fS7vSUUrun38vs7j7xTySmiSvQPG8be2p61RFrnFct/qeO2LdLjJHxgNAUKyGAvjcfFSBDaonK
	EOB0yIPrsFC8dkH2R4iop1Q+EuElKUp5zoFsnrqyKPhgYVH6yuszibX9JScnvubxAbJECWQWH03
	Kzvd2swvI3JAnOJm5dtpyCrIB8L1XgH+VJ5FJSi6jqPHnwydd2xRMhOePyj3j2u58bwB2fLHfzV
	7nB9f2poyBPxmSxUacOZAcG9hrFUkOPa3MUc9XwLOavm4wSGdyy+RL2V9cEiVxOw=
X-Google-Smtp-Source: AGHT+IHolFmrbsPL01Gij9mDgcL6wtIFQuNZ62CxZG1hurbWV+WEoYmcgYDEtNQjTwVOdmXwqzHL9A==
X-Received: by 2002:a17:907:6d25:b0:b40:52:19c2 with SMTP id a640c23a62f3a-b50aaa9c937mr1500673066b.20.1760178016637;
        Sat, 11 Oct 2025 03:20:16 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12a8esm454077866b.42.2025.10.11.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:20:16 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH 01/15] mtd: rawnand: sunxi: Remove superfluous register readings
Date: Sat, 11 Oct 2025 12:15:03 +0200
Message-ID: <12756386.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251010084042.341224-2-richard.genoud@bootlin.com>
References:
 <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-2-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 10. oktober 2025 ob 10:40:28 Srednjeevropski poletni =C4=8Das je=
 Richard Genoud napisal(a):
> The register NFC_REG_ECC_CTL was read twice and the result was not used,
> then a third time with a mask applied.
> Removing those calls didn't change the behavior.
>=20
> Tested on H616 SoC, scrambling enabled.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


