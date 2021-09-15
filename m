Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919CB3FD3
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Sep 2021 05:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 02E7268BCC;
	Wed, 15 Sep 2021 07:47:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxMUusC3UZ-e; Wed, 15 Sep 2021 07:47:37 +0200 (CEST)
From: Dang Huynh <danct12@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1631684857; bh=hk3TBPb3XByb7dkd8zj+jb77yKVOEFqeJoFs9wzYseU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Yk5407Vvw3ia2DZ3fY5t7XRmG6FGQ4/c8EyCQ/25H55QH3rKYIjCIP0cz+TlIiN5p
	 04h37tHVzfuIpm8rDmwwriYrZ75VIHJDYkhpEUSlvx23ti2YsFPge4M1rmPrq3zfkX
	 51MA2bWqVTyBRrI8/OUMOPs0i85i8xvCyS+5PXg3hSrnx+N90+ffaJGdTSX6nRwJoh
	 A/h9HbTtnu2lT4tExFhPsnhFPcjYcaXlfh2RR7m/SBQGu+YLX6y9cbrlOcGuaHoQjY
	 gLX0dlPeDhVJc0wr9A0HaHgCvsaVTvdpRVHGRz7PCdfpXlr7LqnBon/c48sYwvvVv+
	 HB6g83whtne8A==
To: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: pinetab: Add HDMI support
Date: Wed, 15 Sep 2021 12:47:31 +0700
Message-ID: <4816863.IXWdtHWlKd@melttower>
In-Reply-To: <2558517.IGp7HM5rsX@kista>
References: <20210914193732.3047668-1-danct12@disroot.org> <2558517.IGp7HM5rsX@kista>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wednesday, September 15, 2021 3:26:51 AM +07 Jernej =C5=A0krabec wrote:
> > +&simplefb_hdmi {
> > +	vcc-hdmi-supply =3D <&reg_dldo1>;
>=20
> You have to set status to okay here.
>=20
> With that fixed, you can add:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Best regards,
> Jernej
>=20

Is it really needed? The DE2 HDMI driver can be loaded and make this pretty=
=20
much obsolete.


