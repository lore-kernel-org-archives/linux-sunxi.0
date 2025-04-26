Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F328C1B414B
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745690454; cv=none; b=fW/Yml6JpUYCd+w9R8nx77r486UXCSan+YQa6MXc1dXLmTz0e01R/1psoNtI/b+55iJTvH5kpOIYT8J8z3bjH+1bHQz++Z9ck0cYRroCog91/2j5dclFOYi6BDGYChZ+wqaQ5LDCTQdG0ZEgOrBibwN4wuNNbt54SYjm0CUv3Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745690454; c=relaxed/simple;
	bh=PEMMQuRLMmuObss6aZpzBeo6DJxl3rhuVaA5bJo36nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KdWL1om9QqQVmp8aUCdEVxTyIx1QMFHsgzSGEiI6c1bsTlUQGxPPSpfiDvk0lvtDFNvBu0IluN5rSX/dJkZVXU5nUNK/XSZM64rbhAMjCIJ7q1x2A0fuph5yNasb9d9bX5mN4bgGvy5HhlfRBxCjiC/srlF1K/X5gThq1Liv0W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B97Chtgz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B97Chtgz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso7835715a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745690451; x=1746295251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMLBbAwF6tPlQxRVDk5Jnfst5lz7qyDDTn8jiS12DUs=;
        b=B97ChtgzfHsi4bkY2wwVLwERuNoHUtxk7v99oASCQh+9GQ/68nEhL3fnnqDjHfPA+u
         WMHHulzmjlKMjmxdvGP9+pt3aw/PTsNKXuJGTk3LVD7Rm2tqJNyI4FV+uvTLMlUUsqe7
         Bbk95HIHiNJ1EhZkxOTwqSaGLZMHNvMI2kMImJDzU4KHZP3GGXn7/ZrFe9gTjtH6Qm+b
         DXVuQXlZ8J2ZgzH2TO8C6FcE4uKUaGMSQuEPN73Eh2H1sN16YUaPihQ7MKSeNC4BoOB1
         hosJijiP7UB7ubVnEUcpb9yYhmYpi4a/K4C9gaurizgHNu/6lBCw4SAJ9UZrztE6DtQN
         Hy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745690451; x=1746295251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMLBbAwF6tPlQxRVDk5Jnfst5lz7qyDDTn8jiS12DUs=;
        b=OsAW6yIvuM1CkdQcUJx3XPdfDCp/y9sOJQU7JL4688x9ofTA7ZeDbmanYEieoLF0am
         0AMB/N8rhPgY+a0I6ZOONpgJvfZDSYunOelEhG3YW5+3TQ5dh7A2WX19ozmQnkOSquNs
         7b+DfiqR7FRMGtxR/1GNNTZyXz6IukLuGwYPLxQh4YkiS8nw5aJ5Cl+IdbYejHYhmZlu
         eAe/7MV7leWnB+Z6xEwTI9BVJQ7xXpS3md/mzpF2g46ki8fY5pE4pXW3u2E8LMttGzHd
         BhPi8iZZs1fkWZLZciYwH3SDc+dmjVSdqhGZRzBeOte8CBPzGBTYBO/wn8H6ocIwR7Ni
         heKg==
X-Forwarded-Encrypted: i=1; AJvYcCXSnF4wBwnfCL6OAo4tNme6UlcL/rPdLMw6+uEIlGG8nO4kWPOz7UQA+0b2v/Bi8g1eipVAi73vt7B+Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUkmsKAiDezGmlov+qQ4Q+igVp5zW/x136Q1yw6brDC9U9j4os
	RK1mv2gCN4VtPmAsjQlhj0CRtmwePMT1HmX+O7oVZNUUe4yCKrHB
X-Gm-Gg: ASbGncvIQHFF5rBmgdn4wuPRQ5ilElMx7oNk9aX79XdBdcEmJd26CyXmXcrlv4635HE
	kJbdweFvhD9BYQKd9GUwD16h+Jt4eZRrSiG9JF+Wxs+BV9GwQwDHmAaRvV2z23SAR38gMCXa56f
	N4+z8lbn0wLXlhnJtFAz5aAkWkqD62QjeAV2v20tMbv/t04JgpJPjo2O6LEYvM9lD7xMD3uXULY
	52MBui3cPcc8C5TouCZtvXk3SSVFl3dBmRPCYAhwfy8hMP1leofSXRxDG9o5InZJEGhGleMbN83
	/I7PXf4D6dKWQvZ3UW8CP5fyUBr+fbm9Iiq850Mv35RVGGg2pXZSfUAJjhAbdw==
X-Google-Smtp-Source: AGHT+IGcpmUd6V//Dy8oAGqBTp+EMOuxREYwc/MqDM/gwlxvfz17SlAjfX0874oELfIxArWQUWoL6w==
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ace5a48320dmr822844966b.26.1745690450982;
        Sat, 26 Apr 2025 11:00:50 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f7c3csm325590366b.68.2025.04.26.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 11:00:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Andrew Lunn <andrew@lunn.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Sat, 26 Apr 2025 20:00:49 +0200
Message-ID: <2219754.irdbgypaU6@jernej-laptop>
In-Reply-To: <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
References:
 <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250425135429.174a1871@donnerap.manchester.arm.com>
 <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=8Das je A=
ndrew Lunn napisal(a):
> > > +&emac {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > +	phy-mode =3D "rgmii-rxid";
> >=20
> > So relating to what Andrew said earlier today, should this read rgmii-id
> > instead? Since the strap resistors just set some boot-up value, but we
> > want the PHY driver to enable both RX and TX delay programmatically?
>=20
> Yes.
>=20
> There is a checkpatch.pl patch working its way through the system
> which will add warning about any rgmii value other than rgmii-id. Such
> values need a comment that the PCB has extra long clock
> lines. Hopefully that will make people actually stop and think about
> this, rather than just copy broken vendor code.

I spent quite some time working on ethernet support for this board. Once
I've found PHY datasheet, I confirmed that there is added delay. So this
particular board needs "rgmii-rxid" mode.

Best regards,
Jernej


