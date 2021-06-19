Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D93572
	for <linux-sunxi@lists.linux.dev>; Sat, 19 Jun 2021 09:02:29 +0000 (UTC)
Received: from smtpclient.apple ([146.241.205.41])
	by Aruba Outgoing Smtp  with ESMTPA
	id uWdNlpebgSODOuWdOlzCH3; Sat, 19 Jun 2021 10:47:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1624092442; bh=EVhls4M1zIT9p9ZcmUS2kT+Ab0aCIZd5D3ytZ7VlzLY=;
	h=Content-Type:From:Mime-Version:Subject:Date:To;
	b=HCxpV/soF9ta/CWXrmy2a9EG9jmjDWkAqcivqd83kZaFpKEc1lyhbRY7yOjAL+AfS
	 PfYtpcLXxsQzYTMJkDekh9jeD8C+2qJbXzUStKsAtMSAvl0Ofy5vMzihDvRl+lGbbI
	 Bx/0qtOp52NbsL7auHEsO/aVAIj5N9WIFlCngi5WhS2EE5hTVah3aoaOwodEaWx/tL
	 wd9rNvRrBoPNaFdXbeN4cKjfCnpGuLaSvC2oKjQCaFqcYOlvv/Hqc3pdX9xRkppePR
	 2FIoPq3rijybGb+eowyT1sf2Mxf13fAKyF0cgBJ2ly4g85sCNxDXSy/SfHjFSQwHLl
	 E141UBA4qDrfg==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: s-jtag on A33
Date: Sat, 19 Jun 2021 10:47:21 +0200
Message-Id: <234576AB-0732-44BF-9C92-2297AC5747CD@benettiengineering.com>
References: <1bb31644e02c112166d3c112cc07674a0225681e.camel@aosc.io>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <1bb31644e02c112166d3c112cc07674a0225681e.camel@aosc.io>
To: Icenowy Zheng <icenowy@aosc.io>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfKi7/VLH8JxnYn8e4dDd4PDjVRlkCHD4eezj/z0/jpzgwPrJKZSmW6vwQ+02HM2TQBwwnlCVGKRZhaX2IDAk19ZG0Ngbx0e404HkDXi5X4WqpJC3abVY
 MGwj7smBwpGotAJqjzpsPVZCDRvUT1M5a3xulRDs5u1v/SHeJbNZ4B+ugO/jJXJuN5T6zV6gNrF9sr3fOBGv7lkaRlHNDKZnOWRsu5TrrwjLy8l48ozJWRSO


> Il giorno 19 giu 2021, alle ore 07:15, Icenowy Zheng <icenowy@aosc.io> ha s=
critto:
>=20
> =EF=BB=BF=E5=9C=A8 2021-06-18=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 23:55 +0=
200=EF=BC=8CGiulio Benetti=E5=86=99=E9=81=93=EF=BC=9A
>> Hello All,
>>=20
>> present in sd-card on SDC0 I've configured those pins as jtag
>> mux(both=20
>> tried 2 and 3 as values), but while Trace32 answers on jtag(PF port)=20
>> here it doesn't answer. I've double-checked with md.l under u-boot
>> and=20
>> the values are correct, it seems something is missing.
>>=20
>> So I've tried looking for PRCM if it has a jtag gate/reset but I
>> haven't=20
>> found it except the ones for R_PIO etc. I also have a doubt that s-
>> jtag=20
>> is dedicated to AR100 co-processor, maybe?
>=20
> I think so.

Thank you.=20

Also I=E2=80=99ve sent 3 times the same email because I couldn=E2=80=99t see=
 it on google group but it=E2=80=99s not google group.
So sorry for the noise.

Giulio Benetti

>=20
>> Kind regards
>=20

