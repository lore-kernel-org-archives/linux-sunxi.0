Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079DE22FF33
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 20:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739996721; cv=none; b=PlBI3Rv7cmuHT1n7tRuySTtWZt/KKfcufd0Dk/R2rBy0Pn1BeflZdVntPxOkK3t4vO59BjfPElsVl2Df5rjgB+v0lnQinrj8QlBnUEMIrowssG0KBEyRIDh9PfQHWkYJ2pSLacdBhV0PMbpvJ0AtcnwyUt8OnjBYnZsjez+SZuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739996721; c=relaxed/simple;
	bh=z2Itno5XHizBUyP+XMgPT9B/6BDBul2rQNllFEnJbYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WaT8OHRAZQiSckg/Zobc/HlJuYjG2u08FjmzqnccQMojqzuznlKHhCgQHLP5s6jvyaqHbbblqFZeuRPNpPMAImbL5cZTwrX4/225xhODcJDcNEqjLkfVUeCnEMCLn2he5fk3+P8PN6bTYiuYPiQxIut8pLsT3EnHHKoGoDN+B9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA5gwNer; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA5gwNer"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394036c0efso962465e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739996718; x=1740601518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2Itno5XHizBUyP+XMgPT9B/6BDBul2rQNllFEnJbYc=;
        b=ZA5gwNerGzvKoBGcjKIdZ8cD5Bw6HziPz69ClPWEraC5siKZsSKx+3+TP0QeQRxO3A
         gTK37yhpOOh9vZvlT3Dtqw2Q2W408v+sHehKhnqOJidnrT5aYaX5aaIydw5WjKeYaqyV
         UelQevnjWCHn8DcNhN711JfejKoGtJZb13IlXWLevJTPmbvRCkCr0H0iPrkXA/umqtm7
         +dIppCGoYVaA7Z+0sPsuxVaV9r2TsqhPWDWoBhganNKhDBx8zVy4waQyXkbunBnsIbad
         F3KQy6vWrEuMBrEECb0MsiHIXP422iISijrT2wFX5WXy+kfAq7ytYwHVHqyO83GAU8IO
         G2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739996718; x=1740601518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2Itno5XHizBUyP+XMgPT9B/6BDBul2rQNllFEnJbYc=;
        b=mrpsqA9tHTm+x3+nXK3kS9JyI3PhdDpDPTLjgCJEN67t23xB9jmIOE1szVUewpfTvW
         G5QS8xw0GP6CcTFgzMZb8JA5BdjvzndYJZ06vjKqLvh1qAm41yXI56hA249E6CfEpDZJ
         6H4bTlkAsqxW8e9w6KhYV2h0oRFd2LSaIlb+W46rfPv0/m2u5CfPyTsLLNTAVT2W+GmF
         LvKm2iWwvPLHSF1Bx/YU4yNuwiZ4wS6OTREGPBBVK8CU6oN5iAofqLvwq96F/PgrZZAg
         D9faIZXfVZSxVdQ0zx6ANF9iR/Kf7L7gfA70GnA5byr1yAAqwNaNYk6xE3WUmM9WHQB6
         ggOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhwPorLhhbEX9JpZGZFWXQkOHHT62gRMr+Qxgw377899NoXvhVzhK3BsTsK+wOmyAf7n88C2/M4E0yww==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfquzuLB93CAEopc3VLDCRfC+AiQvr01My8rVaM2y/EnpXm/t9
	uFcAvRh/tP8Pf/0iSDeI6qQL2I9mBQKRyYvqqUJ9m/c1aZqhKNWA
X-Gm-Gg: ASbGncuALYz+SlvRvPyS7+p/B6i1eRWxCViYexnM6k74Ni/fRn6OfIxuq1T7iEp6Cb7
	9VN2bZg+UAsf2p7gcSnP/GcIPuq09IaELhz8qo2ru2aNr1/MsGia2ayuBXXi5yA1+Lh2z3+xdbY
	8TlYYgb2D/Q0EcRAvsDR8T/3nwDoBp4PkeBLf2ZAaWhi9B8O5C/xGIeGx1x9NvClhpigdWNB+yq
	84GJz1GtmjgQR51WZMlR64s288GssCtNLic1f70rhvwBit/BBOSL9C3zgXPVEKFyVWXG00XE6j/
	OK59/AyiQkuf3NPwev26gqJTsHBbgvj4wmPTcAK+fUdlUdS//GEfnawpRkNi5k98bCU=
X-Google-Smtp-Source: AGHT+IHf4EAn7H3CMgTwZHs2HxQi2OgH2VAHDrFSev5fKHMaDGPeUF2VlnzgRIOgA7Yc1ikIuakyZg==
X-Received: by 2002:a5d:5f8c:0:b0:38f:3e8d:dd42 with SMTP id ffacd0b85a97d-38f587f3f3emr5580525f8f.53.1739996718008;
        Wed, 19 Feb 2025 12:25:18 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f0597sm18467209f8f.42.2025.02.19.12.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 12:25:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Andras Szemzo <szemzo.andras@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 08/10] phy: allwinner: add v853 usb phy compatible
Date: Wed, 19 Feb 2025 21:25:15 +0100
Message-ID: <4604743.8F6SAcFxjW@jernej-laptop>
In-Reply-To: <20250205125225.1152849-9-szemzo.andras@gmail.com>
References:
 <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-9-szemzo.andras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 5. februar 2025 ob 13:52:23 Srednjeevropski standardni =C4=8Das =
je Andras Szemzo napisal(a):
> V853 has a dual role USB phy, similar to other Allwinner devices, but with
> only one phy. Add a compatible for it.
>=20
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


