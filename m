Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43075340DAD
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665815; cv=none; b=aOzipv+9Bv/gzvCMDnMBk3g8S68Zra0snIV1QPzYQjDTNyQuGY3QewFj0JiEc65RFiVs6lNbM047Cyxfy9Kt/XTfJ76rILo8Q6MSPzFA0nMoutE8LjXSsLIG+IpEQLs1sQ4N6s4S/13bMcfvNen+ezYrP5HAipmcE5w1P/+cQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665815; c=relaxed/simple;
	bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/KFRCkU12TymIjXbN6YSIf0fcKiFGthaPXG3aKp/D1Gdf2w0E+X34CWmOs3XAgTGbOLTc7YAA+pYK0KmEbNXz51CIwRMF8zAxSOCj1Cu53B4hm1N0JDvODPprWoDeOydw5ELTpkB4W/+gt70EasgmOiHGm4zFcvN5X8YikKXvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd+72GWY; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd+72GWY"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47710acf715so13274645e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761665810; x=1762270610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=;
        b=gd+72GWYkARkuczub+EiJqqo4iPogYoqS3xIlCv9a5UorzuS1vAXyQ+Hr5VZ1VbGo8
         Jm3BpNvzyxIRQKXQqzxb5Mpv5OOQYeHk1rsJW30AmUJzq/UtriYoUeNfLU0D8XQQ+6SD
         RRQHR6yxKdgAMlPr65uiAE/sW/BWaGXF0h0XgvPm5tr/Fy1PfwmrCqjad0f0iyzGoCBA
         JsOcW50LA4S0Ulr2Y2Bzfxc3BC0VRq0amyyUQqdZLklt3Coixzgr1QHG2QFtl1zxbf3b
         GLOkpGrPaYirf0WnBGewSS+tBMZrKkodBuZD2ShiUpscgN8iuWEWfMF1OTE8HKDBtekf
         HZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665810; x=1762270610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRHCOkh4N5PCb53quDW9/VegPwopMuUXUgLMaF1jWbo=;
        b=JC9LEkLTxB4EIfFPlS+cXYHI1ghcZtMGfDhBzqNDn11NjhY2K7dVWP000enyKSqHlE
         NtudX9tPN3WdLp6BEAU+2Olf+EFPd2/BIhZP4fTM387gvvouou8AUMfW1Ug+AlhsDslS
         QJB8SIagKSXLP9kyoXbLEcaVBHD7ImDTBYhrlrJqPqYnL74f/Ye1kE317uzsb+6tXESM
         8fJVqSIWJzpoAkFpioKijn4h7gLqhw2Vagq4H/YC3O4hoKBNSkiQ0b7YUHwDfozHQ9Wr
         ZLkiaKUZTDNoYP4zDKqb0ciyh9ysWLHEQwIZj76bCQWf/ri2wH2o0vM4HWW+9wZmhVpR
         U5tA==
X-Forwarded-Encrypted: i=1; AJvYcCVzOZNZ4/AZZwD04V4v7wsiB7J70cxjcIFpl7fonvo4R7zEuz4yTumzEdwou/Mo1ygT4YDdNdb9CvPAig==@lists.linux.dev
X-Gm-Message-State: AOJu0YyArk17PjcMlWrFwHnlTnr1fQOxJuss6cKRWXZ6bum8i8qIkcl/
	jzN9+JnIsHd/tdvUdkikVgUrV7+bh+wk5MLjvjC+/QnLuSsdvhJqTAzbnNuAGD9x
X-Gm-Gg: ASbGncvdApLRuni4RxwpMPbRemoH9u2p9+kSoOsJmiiLxZH2MPGDW8oyMwKghkbFk+n
	YDkcfiyz1kUk6+zHsFqpCNTnt5PzY7Y1y9R9LRv8O4+d5bk/lhCz4FaE1YfCSLqvmRfOp8qIvzX
	ftqriYQIu2uYJCUYZt85N4DS9sxHqm837EYLJ6frw5faHsZpoEUfWB8hYFBRLM6IPkLAb4AZWwR
	SoqkIdhy3p32r8WB42+bRILykfWL+a3uwEOGa0CKIIv+9ZmDb2CQPc/dW/SxCXNyrWah/9ef98l
	SJ8SkNvb2zYrGRUaw+SxSU8bQLHCu0zUGAREZCXkSJiCwP6XXNhUc65r6vUeVbutR0HLnXy+jXW
	0nn9PY7Dx/Po3rwLRgyfvATekHEBwcKqaNi200fxwTknCYC/0LXPilBBT2IMFIH4vJczuDhwSTb
	KADHoq9q1UW61Y0tfK21CE8n6qI7QW34cQED9mIbwHz/xLqAlq0TtrsPYYrw==
X-Google-Smtp-Source: AGHT+IHcEqxrDGNbCr9Qf3fhYUvlJSJPyM3H2iUm9WQHT2tvvW1arfoNj1Bg06ZOGX1vRi4tbPm82Q==
X-Received: by 2002:a05:600c:8216:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47717e30970mr33449425e9.26.1761665810438;
        Tue, 28 Oct 2025 08:36:50 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e41sm202105775e9.12.2025.10.28.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:36:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH v4 05/16] mtd: rawnand: sunxi: introduce reg_ecc_err_cnt in
 sunxi_nfc_caps
Date: Tue, 28 Oct 2025 16:36:48 +0100
Message-ID: <7866116.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20251028073534.526992-6-richard.genoud@bootlin.com>
References:
 <20251028073534.526992-1-richard.genoud@bootlin.com>
 <20251028073534.526992-6-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 28. oktober 2025 ob 08:34:58 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> The H6/H616 ECC_ERR_CNT register is not at the same offset as the
> A10/A23 one, so move its offset into sunxi_nfc_caps
>=20
> No functional change.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


