Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ED735FF53
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836981; cv=none; b=SGZrqNz7ECELJv6kWfUZfeQE4CajUxwlNCEpoIxmKIl6CPltUDuz12ilLFfqvTmvHeXSi4ZwWwL06Viz1n5PH9/A7yLHru3lBDtHuTxyGmwVtxX9cPCEYva2y8saLYBthuB8aMTANNc2QCvikagwRrLci+34sK1RDcoKyuU/KKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836981; c=relaxed/simple;
	bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cgBtsYAGGXxksCgpTHZ3N5Jis236GzawXRhg4RrQbtQOQJJ+UH14BecL71BMrUWJjz7fsCkwCK2xczLcYYnfX2MvTj4ofNC/CmrYluIws7t9DhT3mg0oC3ETdTeV71Ry+IC47k+abXkxersgPsuH5mpf+sMpzejM1NPtWjlQJms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFOARvgU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFOARvgU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso3118195e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836978; x=1769441778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=DFOARvgUMXf0cHZ//u9O7LvkPSCTzM5xpP9EC4xcYg5Ov1AHuXkEnBtz6LdIUFtqxM
         x5/8AKtMVl6jOycBJgaZ+WeuvYnIntCcNp7bHExB7mqMWflU7fcce3bG5ETo4RYdJMFg
         erz9Hni8bksL1cId+T8zKUtHOWlhzJGU2eaP87FxAcAn2PIouOx6rUpkWh/Xc1BfjyIa
         IdqACNafwzpJHWxX/gd5qpTWS2z/IGPdYaZLn52c/Vizd6LWPjQT87bOUpDMP8sSBOos
         bMms9qHPA3kCi0kjXjD6E4RW179TFNHLjNtSto+tB6i0MbBJ/8FRc2MQFLs8muMe5KS/
         lmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836978; x=1769441778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=IvUyXkVf25AL6g8KvHHy/E0vJqwgCMX1asW94VPhyyhzTMySt/JdEv24DIGCaAPJo2
         sI4fYa/9GrQzjMhQLH1MbPXrd4kWCxH9enMii2Q4TCHTit1U5QOlwJfnxFfL3YVgAkyj
         hsdMk8+m1lQWJicQ/iDPVscjdvvBz9AdaHpjSbEaMDog/VBpFzpdNE+BnH3drcAp7rWx
         8qaIDSb4khVWdXm6AMGiJ8pn2nrWfmesPYRR8ZKl9paTArWJMWAawzS7WYjropa/pYbQ
         cxtK6cNgBn72Mc/Wb9ArOAPNefRi+KB6jJ6d/x59kgNNHUHvd+V2btdQqb/+LJakAa85
         dd7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7EYlsWiwsgLiWtnvPKCBPIff12u9DH/fCTSH18EA9+lVJoEstgQyHR8Y9nHunsB9PZlxzi6ZmiglONw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwN8Ckewu7WHW4YkDqLjRJKLB3KpB9CNP8G4Vl0chi8cV3+wXSf
	pJ/kX5eslAo6wL4pUAQGJRa0fmIjouv6SJBijykQ/ifOveFs9kSbri9d
X-Gm-Gg: AY/fxX6dEbs8K0BEkEVCGOHzYufl6gllutOuH0VfEh0GbVP04eQTwmEhUsyUodfP3hL
	Lkt4HFtKwdk6pZKkRo17+//Ru+KaUXn+XoFdl+6qKgxujoT7GzfITDwErK60hso6u5kyJ5PnKmi
	anhDS46/8BMPZNq5qWKYXsTlr0Ekc+hXzi/o4qPXEVchLX4KgJSzMV5PgB+ylZi+F48R8593Yx7
	Z8EAEOJgB4GklSPCwDpNiDyvDvBjmw5D1P+vGAmliIPREZiQCyTEgrVeTFU/kXbXUO2cmFcKsqP
	myVVboFCt4Mwpkl2fjKp2V8CICdaZjYl+iwaJJzUzorCx66TIJent4cjL4w3j/eL8MQj2ZUI3f0
	ZLx/ybnq6RTQcCCpmdsf5Avkbgyu4OejTn6TZeZO1KHNhNEvs3E4ba3IqYC2GqDy2EWraBfNvD8
	BW3sxBStyt7AII7FQ4QmSBNetpPX1siOo/ZZEJCf9olHWVkHmtasBHYBDeTNp751L3mTkp
X-Received: by 2002:a05:600c:4584:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-4801e350af0mr140088985e9.33.1768836977812;
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-4-198.dynamic.telemach.net. [213.161.4.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ff1sm23614533f8f.13.2026.01.19.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
Date: Mon, 19 Jan 2026 16:36:15 +0100
Message-ID: <5957177.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
References:
 <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 19. januar 2026 ob 11:40:19 Srednjeevropski standardni =C4=
=8Das je Bartosz Golaszewski napisal(a):
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


