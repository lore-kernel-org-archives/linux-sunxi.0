Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793953711;
	b=dmYjbP45XdQgRlX8o0zil9x3kTDjJaavjzjTMmb0RfXUpGZTJ9xKV2w4knWPcHLqkauy
	 m5vDP8y7lhFM3D9qV81aHF2N/J5AVlHxldTFzyaOYJnnFiPD49X0jnEUO/SGIQfyzgW10
	 NudMDoyPRTKc3ROOCnw6iWOhH0iGQMPdiNJkgVOqGKpXopFDwqQTUV7y9xd+MCxi5CL/y
	 Bejm0wO8UOSlpVQTt4IXY43Hq/aXjidu6ygql+6UnhbyqRn2jdc8oCvaq7RCUtRNuYJDF
	 fautGQuCAQH1+7B8shpA58bETlLU9au7pNdR6GWTC4mudS5UrYhbNSzS1FQmkXNCRyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
	b=F8mjMIykEb4WfpPBPrWUYjcOHyCyCG3j86zrm+KUT+I1995dn0AVAzQbNKbDGhSI0/bh
	 qV+9UPK/cy41qJVWASg2zn+Qx6cTBzzO9Tk4pd+l1VR076TYJZVeadxaYSm/+3QPvFE9Y
	 z5m5K0l1CsvL60C5YnYiiYsP7kGI6MIXq3LczVR0cFEw+MAv/B6/ZNlBUmaBX2q8w5hTo
	 KLrwT5mEdbrSYFVT+7pJ6rUn2dm7xzTOMVX7ZDVSQ8iyIv2+XP83cZweF4N8Gf0v1mHRC
	 hFvC/3BXRm/LERbys9/TOE1F5KjiUn+UPutPxZnVuf+BYNpn3Ay0RUpthdmcFfwxasg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc7YfIzY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAF0606A32F
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Nov 2026 08:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAF0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc7YfIzY
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7c03744ef27so129229137.1
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Nov 2026 00:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793953709; cv=none;
        d=google.com; s=arc-20260327;
        b=EChSbZRKjjEc4HcBHSIOw3YLaGujChigKMty1NAk32QWpLEpkpKbk0OEway+x+8Rx3
         gRKBUA0BzTQyi9FhNEjGJj7muz+zkylETDDEGl/qrqnnWRgRpPiDFOL9ICEzb3Lubmm5
         zQzQEKzS02a5ieWvGEcCGN7K4Wo0Zq0H9/F3KiEpHoL482eCzDHTuqTtXtJcr2eqJV6R
         obHFMR0eQb/4XNjlhghk3LwsQCH61/5MYXLc9HOtoUNNuaciGRX8a5Y7HRSIL+JO2Nyo
         4SzCiQQU+cMIRqwFFWoa+WgXgUHhLmsI/YOxZpqfRrM9H6osq1Af7TSgBuMJSzd7sMPV
         w5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        fh=Mr3NpsAZWG5kJCmLYdVIRnZKJYEyROqIYEHZRo23U5o=;
        b=q5666AWnxUYuKjoW6tN5yW5mjZXuN3nlxFLOjjv8MdEURtd3sdvTntwQHhVKc3lUq4
         L8ZlL0gAM8Hpy2kqQoXROUw+udP+jzN9JIyau/dAAMN4ETc252O3wyVg9uAD+yyex3lO
         XHLySxHyX08xV295iJFLFDuXSW6NXgTg8kgg4v2l4TL2T2fyMETH8aSExFJI6Dd34bjB
         MafFHNwxGjERkNCyxlb0pxkd8MT207TRg+ZMif8ZwUiqUThj0WjADLm28RdUz9AEy9dg
         ZRmlAx6wWy5tI8ED+7A7lZLKpgI/RwRTEYU6gZMPQEh+3CgfUVRBCeCfvaYOIVskn8t/
         0k/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953709; x=1794558509; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=tc7YfIzYD1XzTkr+EeBKnsf1lnbe+laPbm198lXi885CCZ5AoYN8nQja8eZSn0fWmJ
         vrYIW6gxU2wBFeIkk3DSZXV5HlAlp/MUqq/ozdiMrtR1N4tr4o2XO8+lyfvnTKnfI1Vo
         yHSyDF2uDLYXNg7DF0aQSJQWSUFr8XwnxZSr/ElQ25UIJF7plxXdHAGQcpdvciTYvKsF
         PE47XTbco+cuwY3AcQaw0Pt7stVj8ixp8I1t0GqjKG8y0nnmLVs/6dd2Sx8OF83CtR6t
         6ekOQS+eS0dTikgb53kfGDhHdIEcmtaW0sVTHaohnJXgbMK2ED3zvkn8hmSWdHWoq+py
         JTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953709; x=1794558509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=cUPH0XqY5ncv5MS5kP7fN93DtLOYlirgE+d9eNVf6l3PDRXVZJFVxKc/WdNW8/TOkr
         lAcJV0DlZxgx8ZN+d7mTLk361rKu2dxpc3dtJYPuSvX8PjqNA/ut3wGZO4ABinzSoCkf
         f0/jTt9eed6SKBM2IAtf7og2QLmouzgBGxozA0O6b0TaPxTyS5N6ncpBde5gybPe1pCG
         otANHVZuhAV+IWv9cWuyiOY2XHCTkoBkcilAjwktOoyifVpa9ua0IMPAzndXRwAGE+fQ
         4sVsw4ZKMcbDt078ena1944zRZUw19a5gLMnNVs9HgY6uWDLy7sc6zNOZ0BpAfm2rgvU
         3qjg==
X-Forwarded-Encrypted: i=1; AKwUvBxZhl9J7DcBx+PXEz5qQvoNOcbC8s8TfT/nSELSN870EXKgahCjOQs8HM4DhTE9CZmsK1VmWYTNk39ZQQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Ijwt3kF14Zvhrk+gj0OYtCVRUgkDt11lV4o23qJiHKjqpFlKC
	ifWeLtaLOurAAcApwr+8CgC13A+qtBRD0Yqp5bYDweuniND+ioLruHblsonLWeeUJEt+jPmslTf
	9L7ryXS902sQ5cwgx/gqHfSpgW68Zt7k=
X-Gm-Gg: AYBFou1ueP0d6Imcm0dlH6oXY7b8+zlsfGPCHsavXspRjROvpeS+aOFxf58Gkb4k0Vh
	23op99G2cLX9J7Zt0iBRa8xwB5LPPVufIjS7yXyzg+9+zUJ3TpAfJx6gllCP51DrMHegEJw5PDy
	0wfXMFER633JO0abyH1X9Bs07O9yxCtO+tr5BbWasYGGj4HopZEERaOU8sZ7I7ZBCqCYIjHiA1B
	rf2vBN+hX+iogJpqn2Ev5zWsPPZ5cd32dPli9Qa7BDJKNk5Ww7EtYVV+1yLaj7FGNAQxyQAxoEd
	dyj5YiSDtmuz5b2mJ9jb5AgyzgoO/Qq9o80MrrSlw1gINy2tCs5yrvRFZHQn0rS2gTqAOMdsgBC
	U6ByuzKWrY3phjuVk+lepoj2w0RuUMDWsIkaNKk/j4nh37iwPsEH6HmW4Rc48zwWPbQ2MnU8Mep
	6d+ykH8mHpUY5yHlm+P62zTiOMgS2PyJseG9YWUhTKAy4cGS3X8MfsoZb21JYeJ+4a2lS/6RwfQ
	trgjhdFxsOWO9wSBuJn3gkmN4A8fA==
X-Received: by 2002:a05:6102:4bca:b0:7c3:8150:83e7 with SMTP id
 ada2fe7eead31-7d2a154169emr1074240137.9.1793953709418; Fri, 06 Nov 2026
 00:28:29 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
 <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
 <20261106-crystal-flat-caracara-ac1b3c@quoll>
In-Reply-To: <20261106-crystal-flat-caracara-ac1b3c@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 6 Nov 2026 01:28:16 -0700
X-Gm-Features: AclHuK97Q_fmR3tCSb11vsNOkfJ9UktWDyo2C1YoKfEXjUnSy-Rv88kHCKF-O1Y
Message-ID: <CADvTj4rYG01pNxZS3FAKzHw9yOO79W-zMdBzaXvV_hrMs+sp2A@mail.gmail.com>
Subject: Re: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 11:55:36AM -0700, James Hilliard wrote:
> > The H616 NAND controller needs its AHB reset to stop internal DMA and
>
> So was the device working or not? Be explicit, because this is an ABI
> break.

Normal NAND reads and writes worked. The failure was in recovery after
aborting an active internal DMA transfer: the controller's soft reset
could leave the first subsequent read displaced, sometimes without an
ECC error. I reproduced this through fault injection, not ordinary I/O.

>
> Best regards,
> Krzysztof
>
