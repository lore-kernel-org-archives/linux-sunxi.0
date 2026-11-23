Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453189;
	b=y9o0/DUCa0BEsNhJUeOQdWAhtTpwQFpHGnhovP58RSgBkLqMstpZReLD1bc4ep8m5XSi
	 G+HvoAMogPYZHJkGCEf6KtDCGHfAccW1942+8gB3vQTfFPEDE4d/cvHs8xE+E5VJKSGUh
	 NT31QK7A0/RKoI9iBjcKwkcWr8eOKqiM3uJDZ8Bs3NPK2Z4i6817eU2BRJ74BE5CfxUll
	 FszwxkswYD6wGqLII9fMJQeWTO4AANZzRKorfh5GRSs2yXi/sjLGwZwvccZUtYmqaXbsS
	 qy4dbSxOtXV4hfwnQ7LrkTGTKzNwJV+m9fFoKBhdOK6rj82ssLnYFA2A32dc0xaX0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453189;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pEEWV9GCQ9jVcC6FPXkNK42oviKXIrsqLWA/ldrkz3M=;
	b=HjotJHAgsk8q49xRntQpucNGV2UYh5dIiEArBnjnFb5D8FqmFbTbCk2YJe14Nan89ZmD
	 IfFWsz3QuwjVbkUQQTFIT5TIPVzQO2ijwdi82aY6S3xbYrrB9/LYHFboeGZB3Imwr3ivM
	 qs0x9COhyt+e5ZyU8MBKvoTjlYsqlWB5ZJXu5qEsv7s4s50p0mOp2VM10Yq/JcCEd7ar6
	 F6L1Y6wyZe+MMaRvyuSfywxGEbvoNWYSPM3/s1w7VL75MRB5smN0nNMxLE8fOa5aVjWf/
	 iIbGgCxEmm8Afqwh5MirkkCPGHb0NO5dk1hx8xddS+DBie+yVMZBbGOhxiOgSeoh0Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NsgsMmlM;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EC9606A33C
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 16:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50EC9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=NsgsMmlM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795453186; x=1795712386;
	bh=pEEWV9GCQ9jVcC6FPXkNK42oviKXIrsqLWA/ldrkz3M=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NsgsMmlMS1M5YNJ+AVOx/d8VyEN0fpko3ITII+lXHt5jYbTZkhq3MLxsG6aKf47l8
	 n4mAaL/aROZyerQ27CjuBl0SmC//08XFY6ScQ7oIObw5PbxH3rk1rNZT+OK6B0aSPJ
	 Mx/v2ZauiBYZm/y151192LZ014mYY62y1Xk2TTDtL0o9JXqKBq2rHnLZwXkY1JPpMa
	 XfAtEEYTweCTfNbemBimGpJsbq5CjVGu3WL4HVi39ENm4SZ0R2E/JN3LsbipsPILsJ
	 LlL2Na/LU8wVHjbzmcEJ2+lAtidgDnDcAyCiIcziJD1wq0vOQUOkCUfoP64YU77DMu
	 zP+365heqmpxg==
Date: Mon, 23 Nov 2026 16:59:39 +0000
To: "bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>
From: Norman Herms <dockseed@proton.me>
Cc: "linusw@kernel.org" <linusw@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>
Subject: gpiolib: hog on a three-cell OF controller takes the first cell as the line offset
Message-ID: <qh4LV99kGaQYdQuGbsPX4b9Fm6Cip_Ow7ImY4icfwI8IsbMQy_09FovZY82b-_HVkDmR2ELMlKe8bzCuBB5NpaZizoO-s4tc11zAX30FDhw=@proton.me>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: a53a4b966980334464fe4015ab5e2765967e63ff
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Bartosz,

Since d1d564ec4992 ("gpio: move hogs into GPIO core"),
gpiochip_add_hog() takes the line from gpiochip_get_desc(gc,
gpios[i * cells]), so on controllers whose of_xlate() builds the
offset from more than one cell the hog lands on the wrong line.

On sunxi ("#gpio-cells =3D <3>": bank, pin, flags), a hog with
gpios =3D <1 1 0> on the R_PIO of an Allwinner A733, meant for PM1,
took line 1 =3D PL1, the SDA line of the PMIC's I2C bus. Taking the
descriptor from the of_xlate() result for OF nodes, as
of_parse_own_gpio() did before, put a hog on <1 4 0> on PM4 and left
PL1 with the I2C controller. Still the same in today's linux-next.

Measured on my board by AI agents, analysis with an AI assistant;
a report, not a Tested-by.

Norman
