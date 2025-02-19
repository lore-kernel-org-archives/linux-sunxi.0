Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9322E015
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739996639; cv=none; b=BfJ5VfgKJr3HNJ3gjNRK5V8PI1UYnPLGN8QQZgJNZlWi/2K9Y/459RXPDPwjYVOGZjWhjui30GJnwxOS+zJrWqB2G1pjf6dwJvxq5bPTSWGV9bxAlnn/sLU4TvBHnsvgOqyobEThg5C2Y8uBmeZjUunnhlyYueV9+bfrKXoaWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739996639; c=relaxed/simple;
	bh=EMy2QRY00y3vndpH243tF2GxFmlF6KLV7i/tcsJueKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtvlIrtPDUTHOHIplbR98xImYxkiKUgPG+Uiwmga1XX65upiIh4Gi+GvDA3d6zx4X0vcjvKFgsxppcVJIpOUGC/JVzye+Cr7Z+g7qfQl0DvKBEeaTzNl3qf318YZ/F3ILxPf7lLB+vtvzZ/1z0Mmb3OC8nbRyQ2rMA6bhNjsGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rb1nauM1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rb1nauM1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so1663725e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739996636; x=1740601436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMy2QRY00y3vndpH243tF2GxFmlF6KLV7i/tcsJueKo=;
        b=Rb1nauM1JohCupd4JAmgsJRl5vyxYoPt7lO8eUYzJtfswAGbXUaJ8MybeCewrXk9xf
         DmZYIWUamg7RvmRjRdJkzq0om0MQ/3TDcd1tYSUNhdfQiKR+jLkTw2NBPQM4uKeYTNNa
         /Z/uNmiJRRYvFdtOMGxDI0vXkcW9+Y9pi+jhyGIHjzd7LWO4NCSEaoH6xvgobVpur6Da
         FJYCggtBGBC+FRK5B8WYb4UaS1jQG1GkGY2NmVsUKRZujCnBvOf7fzddZWQRehudM3z8
         OyIGdI662yRavPUXvj/hB6c3lcm3tPMMUi2Th2ThFmmkp11KiozTw2k5TdUJfid+TsL4
         HPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739996636; x=1740601436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMy2QRY00y3vndpH243tF2GxFmlF6KLV7i/tcsJueKo=;
        b=gEs/y8yLWteD3xtcvt2daUz1sgh9/Iqnl2V3pKL4b53QVLfMW+HnDP4VG508vZK+Rb
         Nlfo7zWZgn1dM3uZnFCp5XC1mWLyMlN9F+5I7I0dbdyW61HXZ3lTCDUToUazAPu02Qtz
         a9euyH8FOHZxtjszDokyypw3rBP8Wc6kREXYoXtan+AXYGhv3l1g9sIIqqwzsSHevkEL
         eMAI/aLOLrxgDqanur30RmLUwFQ38W2VYdMSmYJWo8DmLS/ui/HFbazUBm9CK8PF0lA7
         pY+Hlxeqzj2TYLLCtYnDfeefiNudfD/NgY3OBuTqusVN2NOdrW6Tna2FEcFQrqDeDN6z
         yTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnHx/4pmKP4pWcqNHKitru5jUn2oQdUUIfceqFBE0NGJdTTqnLlPuUFi/2/CjT7s+HDHIagCAiLhus6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWRTi6IP2OBYhkacE2QLOG4xt4m41q+bEvKJUC+5QGTV05ebIi
	un/+qbc7tp2v6cZHnX+1o46AyD2VODMSA++j1FZs/CcF3pRHNjZK
X-Gm-Gg: ASbGncv8yKK1TGR18GebGQIW31KpwEDm+lwj+fjiKWuzOfk1z4CDc7ypvqvFKZ0S46t
	PHeaZXhtBgftVbdEhLkd3sLKLCQK+Yc2VvOhRWw2BQQYWiPWK9hZr7SyXrKRC2XyMjhavp43jHy
	Q2fbnGgM+6yosmXicPOBfAvbRlnQAJVjoS4+BdelkVy5AnnRhyX3bvUhvq7a0vROhwNdQYQOFrk
	1in2YZqGBWF6AhdVUrOGpo5Mx5of5B+Uej/czsnGt67VAzlnarVMjpjNyuGAJ1ox49LXYtAyWZZ
	qP8CnP8gGNOzuD0gvCjP4UKLtLb10ai1P3C2nrhTLq/hWLcTkbjHQCsm1yS5+naXZxc=
X-Google-Smtp-Source: AGHT+IG4f59+CX698iufYSZmg97ar++Vk4BBVCCuVRmsKRvyGyXLNfOF7rWePEa5eNVo3mM8fixzrA==
X-Received: by 2002:a05:600c:3c9d:b0:439:5a37:815c with SMTP id 5b1f17b1804b1-4396e74257cmr166567915e9.20.1739996636120;
        Wed, 19 Feb 2025 12:23:56 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b84bcsm230088425e9.40.2025.02.19.12.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 12:23:55 -0800 (PST)
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
Subject: Re: [PATCH v2 06/10] pmdomain: sunxi: add V853 ppu support
Date: Wed, 19 Feb 2025 21:23:53 +0100
Message-ID: <17060368.geO5KgaWL5@jernej-laptop>
In-Reply-To: <20250205125225.1152849-7-szemzo.andras@gmail.com>
References:
 <20250205125225.1152849-1-szemzo.andras@gmail.com>
 <20250205125225.1152849-7-szemzo.andras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 5. februar 2025 ob 13:52:21 Srednjeevropski standardni =C4=8Das =
je Andras Szemzo napisal(a):
> V853 has a similar ppu like Allwinner D1, add compatible and the availabl=
e pd names.
>=20
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


