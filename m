Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3F19930
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Jun 2023 17:53:01 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-565c7399afaso8418927b3.1
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Jun 2023 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1686246781; x=1688838781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bqL61HasX+3yOZGjEzldUYwFZSid19ByB6CFxY1vWDs=;
        b=NRcYnHu7SThIkFteWVApS2D5KCWyhhRu1mXgj2WqlgO7k+4vhCHUI23z5gbXhw8dEI
         mdV+ky8h0Km20cEQAJPdsL/Uvy7UWW1LKYBuvWqx6GqB42Z4N93zYxud2jY6lLzIFyZX
         0JkZZUHPznZsmOUkw0SlkztIkPwq3d0hcXqE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686246781; x=1688838781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqL61HasX+3yOZGjEzldUYwFZSid19ByB6CFxY1vWDs=;
        b=BKBPRtk/ScdS1Rcuo8Ki5En0lOhblS4NOc/vbldmbkChmvs+NNJKYP/U0Zj19sI2id
         lHNPTmmYTvZ5vOdUqMEwJYJ6ijT8CEUTK3DJceIMKvKTxESw07u26IxN1aO7AgliJSkI
         eO8zrLp8JZ9Qiu5A76UZvDRpEisHZ6qaD0hKkS/zxjOYIl+UOqpm+E4pLTz5zX+92lKA
         zSa6qMXcWGOdKViWfouMGVUHf1epJfiJAWHjKXkIqz0S4KNVvQIJ9qkR21UXZ4u4O6eT
         YGt5Fzi+3JdMZoTvQJTLO3EZ/trg3TwBU9LFlLWRn01sMbCQwCW29p9CWy9Prtl1nLQx
         fyxw==
X-Gm-Message-State: AC+VfDyp9Ad6ryTAbFMW/UjhRNYfvvw+dLOM48xnK2HU7xWr7HW/Lpw7
	Jr14lGHvQLjkfn5SrrjOio0/LA==
X-Google-Smtp-Source: ACHHUZ5vIQvR2WpbfkqdiDhDiVUbP3luO4xzLvUc6AGy4A7KoX9KHOAc+Wakd/vdS3kmQ1+z+QtHlA==
X-Received: by 2002:a81:6d96:0:b0:561:d6dd:bc84 with SMTP id i144-20020a816d96000000b00561d6ddbc84mr359829ywc.48.1686246780777;
        Thu, 08 Jun 2023 10:53:00 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-aed2-a4e0-63de-e182.res6.spectrum.com. [2603:6081:7b00:6400:aed2:a4e0:63de:e182])
        by smtp.gmail.com with ESMTPSA id i5-20020a815405000000b0055a07585a91sm75326ywb.11.2023.06.08.10.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 10:53:00 -0700 (PDT)
Date: Thu, 8 Jun 2023 13:52:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev, Sam Edwards <CFSworks@gmail.com>
Subject: Re: Pull request: u-boot-sunxi/master for 2023.07
Message-ID: <20230608175258.GP1871110@bill-the-cat>
References: <20230608003036.12179-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rjg+J4Y3EZoHmoaG"
Content-Disposition: inline
In-Reply-To: <20230608003036.12179-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--Rjg+J4Y3EZoHmoaG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 01:30:36AM +0100, Andre Przywara wrote:

> Hi Tom,
>=20
> a small late pull request for Allwinner. The main feature is just a DT
> update, matching the v6.4 Linux kernel DT files. This also enables a board
> (LCTech Pi F1C200s) which got its .dts file merged into Linux. Plus a tiny
> typo fix from Sam.
>=20
> Gitlab CI passed, briefly tested on an H616 board and the new LCTech Pi.
>=20
> Thanks,
> Andre
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The following changes since commit 0a8a4b86422650d6955a238279608973545390=
2d:
>=20
>   Merge tag 'u-boot-amlogic-20230607' of https://source.denx.de/u-boot/cu=
stodians/u-boot-amlogic (2023-06-07 12:17:06 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
>=20
> for you to fetch changes up to 9bc6f1a4d08261032d60836ea1dd6f2e98889060:
>=20
>   sunxi: Fix typo in include guard (2023-06-07 22:45:02 +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--Rjg+J4Y3EZoHmoaG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmSCFXUACgkQFHw5/5Y0
tyx3ZAv/VK82Dv1UANtsEB/R7MojmticEfBJ1xbnIACRECk+9IBJRJ5J4kiafYic
EuQc+ENzIwzo1n2JIIxtlCydmuDfOPU8xwdj0b16q2c1KVOsLKVaHES07RDVJ6Rl
GyPAsubwPyNbVZeDpJrlIlCe5XShQc4cnsp7DCRypFQSa8DXkTIFhDkzd+4VvuYk
7Zphtv6/6QRyZi/g6SWO2jSal5QKAI3ND8mzo+uncXp+sRQpTvweMN8SGhVuzfO7
KN1u7MZUlxE219VAgxnfIcxGxxubS8y0V42sV+FJb6weyKgqzxGqGBFnE4pUNWd7
XQ/MtfI+svogsWvmGXgdamuK7KxQi3YzpKM9BHfjS3EXgVaycMAt4Y1yhragLWg3
Aqm3DZ7lv9axNFRhWtlKWgZRdD7kOBn8LwsMfTlntp+Wr457FxteNiiH1qOtd/hg
Cu8ZxIO5q1X3Zj398CG/Vb71FYmHkDaC/W4+S3uhQE8n78mhG0yI9opTWYfjUlbD
L7XDjvcJ
=Fjuj
-----END PGP SIGNATURE-----

--Rjg+J4Y3EZoHmoaG--
