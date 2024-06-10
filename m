Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A014B963
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718041786; cv=none; b=FCdgsktx/jC4Yhl55QyBp0Zv2kuQXPWMWvGfCJUWlACCmqxL06rLWHSir5kYBaHGljHxc3Ie4RTMvtIHi/fJ51F7yT8/DGQrM/muWE8o62crtlaYj+dMJteLbXfBwIb2usqWSLHS94Wc3m+eqOldUFL0sEXEx44PPdMNzH36V04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718041786; c=relaxed/simple;
	bh=kaN+OH8u0mjuLsUgDZzqsqHcd5qKUZnSBirUfTBy/rs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mIGAkmXApEgkayHTJd7txMfq7TgJfp4J6jsmBVsfS6i5VsYw4pVa36hy2PnJgQXBsmrAG9/vP/y2S5oBf23VZUFmyHzbnPMcRgULH0LHNy31V4ND6HpLom70f5nTtOyXO/1JqtRe09x8P7zk/HBcXAqhb7wfP8wstVCKFxHcecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=nLcDp1JL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="nLcDp1JL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42121d27861so41308195e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Jun 2024 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718041783; x=1718646583; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zyb+ujtIGgfui3VzqiGKyVsxQvcv7H95kxqnj+CmxU=;
        b=nLcDp1JLsp8+cWupLFojQBIu3SV+okrurfXXY7jAm3qSRVbGn8gAwSpruUQA3RapRH
         /so5G3ruj0uaUdJulvUe5mGWgNSCi3lW4LIviw2Rx+cPKaSlNS98f2G2b4IZIWO+NoJt
         69xeK9fQi56cDysnrSCu97GDDZYD8Hbk8Ws6QeQaJXw7oft4AJWE8PjZmzl73etvFRny
         QwtmMPIDatBZ8KCQ124WZtE4G9i5J/AYNMFoqWPnzqsSZu1qzcfBOS3KBP8uwTX6sjj5
         wMkRooMlSBhNZu0BLohgezgz0lOco9Y8thSMNztvkpi/7+bh15NCeE0vfuQ86z9d/UPP
         ohXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718041783; x=1718646583;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Zyb+ujtIGgfui3VzqiGKyVsxQvcv7H95kxqnj+CmxU=;
        b=M7EJiUMBdfgp2x7knldyn3w01+ILcpIoTy6dy/getgIsK6PwPxWlySWP7GJYaOtRpc
         9QZP9mCIGBDrJb9nKMZFYwH80QEXjbw4+Tnc8SCD3W6qXCsLXpekgjo4NeYN+UJ/uVuu
         OkNtyeaBhk4ssKJLGlU1ZMvZKQO7iQ4BArcfcKQh2yqWaiIUgEt6Ya6ZLVg0afCv8u/1
         Pfqb5knpK69Ppkv5qL5TbUqLcJ2x+NwBg1LeICPGlsc5HpMKJmsa/JOdFTBzjXnAHVzs
         9KRgsXMC6H5/oyOuAAsJogu8z5kR9DSlqNQy5QrQT/si9oCHZeYfszh9QPXGmO7tnTc4
         /UeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc+psQgBT/T/ORUQ3pxtsI5fSJsWJLqWYmfqBZl1NPIHt06CWb6DHq9uGdhxHCoTQibB4S5Ellg66OdV/mo+1yIf/j8u8TNQEZsSA=
X-Gm-Message-State: AOJu0Yw8VHGLD7w5XPbIgpSjLrfAoSid7JbaVeaMoHZ69JfSDEx7PTSh
	t34veLuU9KnnHxADB3WsGfW0+nGpBnlqkf0C1kCC09v1OquXODjOJg7PIJMVnnY=
X-Google-Smtp-Source: AGHT+IGOL4J84jhPB6MOYY7C/yQXa66itQV4TEzYbITX4tGHe/3k2ra5FCnezqsLOntd6VEWEWr5PA==
X-Received: by 2002:a05:600c:1ca3:b0:421:6b79:8900 with SMTP id 5b1f17b1804b1-4216b798c9cmr55824915e9.41.1718041782597;
        Mon, 10 Jun 2024 10:49:42 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e97dsm149074925e9.5.2024.06.10.10.49.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2024 10:49:42 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
Date: Mon, 10 Jun 2024 18:49:30 +0100
Cc: Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>,
 Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD6771F5-5739-469A-9C0B-952AAC62AB68@jrtc27.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-3-3fe591d7f109@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

On 10 Jun 2024, at 05:45, Charlie Jenkins <charlie@rivosinc.com> wrote:
>=20
> The D1/D1s SoCs support xtheadvector so it can be included in the
> devicetree. Also include vlenb for the cpu.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi =
b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6cbe0..50c9f4ec8a7f 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -27,7 +27,8 @@ cpu0: cpu@0 {
> riscv,isa =3D "rv64imafdc";
> riscv,isa-base =3D "rv64i";
> riscv,isa-extensions =3D "i", "m", "a", "f", "d", "c", "zicntr", =
"zicsr",
> -       "zifencei", "zihpm";
> +       "zifencei", "zihpm", "xtheadvector";
> + riscv,vlenb =3D <128>;

thread,vlenb

Jess

> #cooling-cells =3D <2>;
>=20
> cpu0_intc: interrupt-controller {
>=20
> --=20
> 2.44.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

