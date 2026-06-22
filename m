Received: from lab.riabenko.com (lab.riabenko.com [185.143.146.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A5175A74
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jun 2026 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.143.146.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151685; cv=none; b=aqZEE/bLovY4Km+meXDUBAy4ug0Bi7KfdNRu8yP5aXG6j3yjG1/5E9wyO0378THe+uzlRjeqZnDM95PBi1yQmHBNwR/jIm5i4bL42z8BJrUZT2Ku1iaZuVJF51sR1JLnrFduxFDqKPj6DMWKQBnjwaZfXiza35wzXSbAk7alQwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151685; c=relaxed/simple;
	bh=2vq3SIZ6DhmoqzNbhRYxn9FkSn+ehSUFo+55Fv9e5E0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AogBjivOlZV1a8tKoAwuS+vZfZFoBMbCq2WNnLhyc6PCtXD3cSzPz8i8dTnEWV50bljhs1ZekeWrvGIuo/boXfTRWsMjoI7YDPRGyqwJgOcJsE48vtDLvcTZjnza/BL4TFhm/FRD6MGD8Ag4RrCtq7TuSydmf4iLFK8lrfgqd4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com; spf=pass smtp.mailfrom=riabenko.com; dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b=bj6WW8td; arc=none smtp.client-ip=185.143.146.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riabenko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riabenko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riabenko.com header.i=@riabenko.com header.b="bj6WW8td"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=riabenko.com; s=selector; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:From:Sender:Reply-To:Subject:Date
	:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2vq3SIZ6DhmoqzNbhRYxn9FkSn+ehSUFo+55Fv9e5E0=; b=bj6WW8tdi+9Z98ORSPOxfHPf5t
	37wK2M7YOgPCsHgpd0HWe8hvG2jEj+ZBSR2tT/531BYeNFs/K9MjfisdWL7dA2USJUpvnHUGk0XN2
	/IfKS5eNSAa2RKtHcSycDnnlc6i/k2QYCija0Gh/s9l5DqiUrizyTI7PKLYywWnn4IlA+23vc7guC
	nT7EKudavKOitmJbBUbuwXc0Fqf6g8sGURZSyHP0gbTlMLfVzeSG1xXr7iRdw/VM6KVUBRvJn1a54
	pcmMvNG18KJ001FQtRqro6bdkWrK0KIYRh9JEgPLGDYWGP57DV+1Mg0Hchluw7S8KWTy8xKTLoI/a
	h8OGeJeQ==;
Received: from desk.lan ([2a01:d0:333::831])
	by mini.riabenko.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <roman@riabenko.com>)
	id 1wbj3r-000000001ie-18kk;
	Mon, 22 Jun 2026 21:07:54 +0300
Message-ID: <e70842dcc5d0c32acbf63dc6cafb1e8cdefa3648.camel@riabenko.com>
Subject: Re: new A64-OLinuXino revisions
From: Roman Riabenko <roman@riabenko.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Date: Mon, 22 Jun 2026 21:07:45 +0300
In-Reply-To: <8382259f9d19c8480bf77ac04d7970d1d6f0988c.camel@riabenko.com>
References: <a20042b7088df2182121445368fce8fb4d129d46.camel@riabenko.com>
			 <2e17130f-0bc4-4f76-a793-546aed49c9e0@arm.com>
	 <8382259f9d19c8480bf77ac04d7970d1d6f0988c.camel@riabenko.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RFOuZP+6EPNJR0VIuX9o"
User-Agent: Evolution 3.60.0 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-RFOuZP+6EPNJR0VIuX9o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=A3 =D0=BD=D0=B4, 2026-04-26 =D1=83 16:20 +0300, Roman Riabenko =D0=BF=
=D0=B8=D1=88=D0=B5:
> I have asked in the support
> forum to clarify whether they plan to mainline the changes.

Olimex posted[1] that they are not contributing their changes due to
the lack of "audio and video support" upstream. They chose to focus on
their customized Debian (Olimage) for A64 OLinuXino. In April, they
published a new image, which was upgraded to the oldstable (Bookworm)
but carries an old kernel.

For context, HDMI audio is listed as WIP on "Linux mainlining
effort"[2]. The audio jack and HDMI video are functional on my device.
The vendor's uboot source code differentiates between revisions of

>=20
> The vendor's uboot source code differentiates between revisions of
> another board,[5] but not between revisions of A64-OLinuXino.
>=20
> I asked in the support forum to clarify whether the new devicetrees
> work for all revisions of the board, including the past revisions.

The vendor says that the same image applies to all revisions, which
seems to be true. I conclude that the same device tree files apply to
all revisions. In other words, there are no "new device trees" for "new
revisions". Instead, those device tree files are apparently the
vendor's way to separate their local development effort.

> =3D> fdt print /soc/ethernet@1c30000 allwinner,rx-delay-ps
> allwinner,rx-delay-ps =3D <0x000000c8>

The rx-delay was added to the vendor device trees in connection to a
kernel update to 5.10.23 in March 2021[3][4]. It was not due to a
hardware change in a revision of the board. The rx-delay needs to be
added in mainline, but this is a different topic.

PS: I drop Stefan from copy to this email because emails to his address
bounce back undelivered. I am re-sending my email because it did not
reach the mailing list on previous attempt.

[1]:
https://www.olimex.com/forum/index.php?topic=3D9989.msg46691#msg46691
[2]: https://linux-sunxi.org/Linux_mainlining_effort#Status_Matrix
[3]: https://images.olimex.com/changelog.txt
[4]:
https://github.com/OLIMEX/linux-olimex/commit/9365757099fe76951aa99029f9ffa=
9a0394e4180

--
Roman

--=-RFOuZP+6EPNJR0VIuX9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJHBAABCAAxFiEEbyuIUwJNVUrtp3hK60bLvjKDmmkFAmo5efETHHJvbWFuQHJp
YWJlbmtvLmNvbQAKCRDrRsu+MoOaaT4BD/40H2ik1Ax2n4x4YeiLz96DGOb7/RDx
fcW8ks27Lw7KrFD4RXLoX/z60YCKpYIPXlwnaM97Nl6A3/DC5oXCVir4lisY27qX
uBDi0vtUyxuwpX06QgCQe0jRr5aEryCjFV+7ZphUwr65VFPsBG7sDl2F/xD8MAeh
fBZ2VEoGo7WesQGaBXoq+VObesaJShyoundLrefDlzMPMUQ1h20UyuaCzMxNJ/aB
Qf2mMABO27wQPRqXWzPXxP9t4I/GOJcegyw9jXjkc3/tX/FUHz3r/XrZkP3uZwST
8+VdAW8Bm2vCS0Jscph3yR9ds/ldsPX2+DVF8RhF3aru7gTG5G9MyCaOlP6JXDlJ
K2CYI3TQbjiwQxx1YF7KAq4bKoqme+kqpAQLR0NLJWO2Q9jvvhl9qgToDsAC0sRV
VHCxksrAvl76cLbOCUTVasELnfPaMx3ur+MUrO1PvX4iedEoSWjTkTZ0swMPmoKc
+zwJiWJQ88RsTHC1L97KWmqJrzGGYB8RQoeRzKpFumEcqevuobqJWYOs6/7qEcZF
LqKxtfb1gFmEHuQmb9PX9oA+TY+21xE95vBVfPUo5nXJSIO/uVi03GuakXdh8liK
JcOCwY8xW1VXj4uMz6mEsWOAlYWBsS5YNipKJs/kDFv6/c0hslv51asMbY5QMd9o
XhmjtQBKW6ju3A==
=y0x2
-----END PGP SIGNATURE-----

--=-RFOuZP+6EPNJR0VIuX9o--
