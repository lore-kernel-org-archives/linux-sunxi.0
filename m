Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A03FD128
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Feb 2026 19:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772305976; cv=none; b=F8tDJ3xRElYsfUCnNyJogc+uxQIJaqIv78Dwh7j25hxJLKMTZuivtAp+Fn+j2ijK5trl9kzt92FOqdQ/qG50qf7Zuxj46Kc4FqpFGDnXPDiqnRZbKA8fHVdtcjO7zrdRZBe/tfozZ3VTf6lu+/OYOJ/HUGwwiOBzS7I9GALRETE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772305976; c=relaxed/simple;
	bh=7vHUIFMe6aqv8rNlp8GpXSth7AdqP3Jvt63LGxY7hZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dt5L2/lBMYfbyPKhBilfPmgv0QVaVWxxK6ahOBnic1vU509q9+R5M2yHEP/BHnuurBpE6OSn32AsH+NVyVixViQge4PDW4ujG0VcZ2Zzt8xMdwvZf/AezeNM1gIlHtSFZwCEbATQAtousBIfWn9/lMufz6KzVQxvAw/LqHfmxDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPXk17kD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPXk17kD"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48374014a77so36976345e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 28 Feb 2026 11:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772305974; x=1772910774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vHUIFMe6aqv8rNlp8GpXSth7AdqP3Jvt63LGxY7hZA=;
        b=TPXk17kDrncJ9ule7XUexo8HV4P2TC4xIH41rS8N8Mu1jR3YrJ9Qc10zdnVPeJPvJ+
         ZuGGlQdqF3ZCoi8vjnh7SCj2gAQjtTwBK0tePvX/WNxlmqk2guIwh/L4QNogXBPSFZtS
         UYcTGFM996ugW9g3vzr3bb7OHmbT0pm9ohb0W4UcbQ3CXDihQLj9QbH9BE4moILrXcRe
         VB5NBtnm/ft/pz7KY10LMz/LRjUz1a6zYmalWEMpHqG7cOm0yQiWeeykfhC1ylgXqoTO
         mfsyr4O8nhKYFEgZSJ5EltFvkRhhkqi3B7yMpqK5IMeG0RZ0sNLiukCFO4j9ZrT+vpc8
         v8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772305974; x=1772910774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vHUIFMe6aqv8rNlp8GpXSth7AdqP3Jvt63LGxY7hZA=;
        b=U7na69WSYJMvbYZqXwx6pxe7b2MjLIrVTzeqkoFEN55fz8P4lq+hK7EQWiJMbNlVOp
         xp71cWFXMNznB1SDWQjZszReoWuIl7wo47XlBvguYhA5Z/00Ve9IEahwHEl+QWOY7uEr
         1GFti4WWDu5Rq9mMw2IrKyhQhadq5upDHpY3NZ2y+d740FaXWu4HSuq0HnkcyTXEPGBI
         w/hju1DvTDI7nxL+2kV3mQlmvd7kUfh0D6AF+pC/smR3KobMGDVMOnpxxegwiKmByE9T
         i7881FxavpSHybMAnFOeGB/sYLlJa6VvZ5BcG6jXC6YTK2d2lmQhGf08DvhtjdO9pJdn
         siXg==
X-Gm-Message-State: AOJu0YyTWEnvsfEOABgzcanRYNnakhZdBojbVwhio5l+55iAqySdIV/t
	WBHI+fYJu6d1B+jxc4bOCZDPw6WvxVnARHoP0M/n3c7FZc/OdiVFo0lh
X-Gm-Gg: ATEYQzwDVV4M5qfF00ByWB8zLFwJ7q7wUsZWExY9oI4DMA0eMyXbIGR+533lKazKzbZ
	QA8VSE2YvR6OGnwJVR/D7lsZvmeZwdG1re7nY3kvOjxCSMxXaCjGTK3jS0HVzzF/yZzkZ6ytVrq
	+ufoplATUhdiCevSFWqPtx5aD3smg6KxZ2GA0Qp1OG3etdxQUHhOOsgpr72STvw0aRwW9WUhb+O
	DN4xWQFrXi+VmmKDZnWXwJRkABcgFbfQPm7B/yPWKiBsOww0Rd8ZskWsDx7CMt7P4t++kXwX+tG
	zupUXWPZaZo0KgELjKKlN/OdNyGgJ2q8Uoh5jM/ZG9bFYfkgT5av4NZY7+tqhsFtoiOd1k08dsY
	D8T8x4bAtA3Pt+vDoOh61Mp2hw6llN1hHpK+daH/7czdORRTJgpTfsFs61JVK6XD9Sys8PPvRLM
	oDTDiB0h/LdZz+7kbrEAD24r2AurS6fGOlEiEE0b1kBGGk
X-Received: by 2002:a05:600c:8106:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-483c9bb6573mr114108805e9.3.1772305973660;
        Sat, 28 Feb 2026 11:12:53 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb318fsm141401095e9.6.2026.02.28.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:12:52 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
Date: Sat, 28 Feb 2026 20:12:49 +0100
Message-ID: <5079872.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260227175157.2339758-4-wens@kernel.org>
References:
 <20260227175157.2339758-1-wens@kernel.org>
 <20260227175157.2339758-4-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 27. februar 2026 ob 18:51:55 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> The Avaota A1 board has a SPI NAND chip connected to spi0 on the PJ
> pins with support for QSPI.
>=20
> Enable spi0 and add a device node for the SPI NAND chip.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>


Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


