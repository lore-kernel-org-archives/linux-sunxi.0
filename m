Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6463F9C0
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jan 2024 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706549664; cv=none; b=TWE7apq5fJKMVUfVDlH46qarC+lBgHmYfaaXiUaTHrsGWQ2Zgto62xubpN2Wov2P0zbQkjMg9qgn4i3OS959gnqd2ljAIfZ2Xt1xKleD96OqrAG6zzZU+XK/QdUZjUfQQ92MpUuJnXPp2WaB9qyGw/YVmmysv+CrOqrHm03MzBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706549664; c=relaxed/simple;
	bh=dBUtWC5LOK+rI5NY0KmiF98ex20e4/UKX5mGrDcqX3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5dBLiYeG6diK6aCZ2vEcH1ZPYUxAQ1jC7TjNFB+E8Jd5fQEXtl/oLNlKPaSjW0IebRDNSjy9auTBCAgenqMUgiRYtV11n1QH9dHd5PIEJEpgEQObD/aV4w4U/FJhr+AZ/Nfh0aaSg6cXAu1qZxTHa1dVKvlRdBFDAxd5qUnNjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=iPuVun9R; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iPuVun9R"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc24ead4428so2196480276.1
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jan 2024 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1706549661; x=1707154461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dBUtWC5LOK+rI5NY0KmiF98ex20e4/UKX5mGrDcqX3I=;
        b=iPuVun9RVGut039MsKHeli3i4yfNclX0fOsTTDKfGzesW8L31m/ooq6bhSrSg39HGK
         e9OJpOq/hWTG8WsbjVKDCIjo5ZgdL9BEUazB8SevlBck68MgDFmnLN2sb90cml+pJilc
         E7A4+VqPIkkY/XxPEAgnMGLx70BGkyKdcc3T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549661; x=1707154461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBUtWC5LOK+rI5NY0KmiF98ex20e4/UKX5mGrDcqX3I=;
        b=qlzUKCSCeiW9nRvSwv4tyLJ2QPBlAlfUNdGJz4FUcASo0HcyyKF1CS8bwyhuqX8J7K
         d3yQ3Kb5Ex0n6sAIgOdCbxhYKG/i/+5z9nB4b8xh60V7Z8g1ncudqlrrKcToDRLISZtM
         0wix5j7W5t84J3eAhbehnQQ4h1FvflMPnYBQyCbj5sw2C7uzkdrFR+20CToz+sYso0J7
         XpIIYSvIUJ6mD9cYdlkaVoXJaJrr2cX/gB6ipZKDMTbysd5SYq5f1/X2DJFZ/7ruRuKX
         tp4nFRs1g8BixWEwuBr+1vtnBicILe5aslanBXFEZh+9w5Bmf1hpoYPO5Y33hgLQngVC
         XwHg==
X-Gm-Message-State: AOJu0Yw4vHvECs8pJGmEt0XyjUqNPDjH7rYazXkS2iXoLlnbWu+r3qod
	W3vSu9cRqjsznqQqymbWtC4N/kXl1KsE8IxhTI1AoU1mRy1uphHPLNf2wAUg2DI=
X-Google-Smtp-Source: AGHT+IFcE/dQNk7Rvh8KugX3SXXRikgjqXst4QrfQapizXKHSPUjuaMMYSKMMhL48Un4iXCFmpEVVw==
X-Received: by 2002:a81:b3c3:0:b0:603:cbe0:465e with SMTP id r186-20020a81b3c3000000b00603cbe0465emr3055342ywh.20.1706549661318;
        Mon, 29 Jan 2024 09:34:21 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-3119-0000-0000-0000-1001.res6.spectrum.com. [2603:6081:7b00:3119::1001])
        by smtp.gmail.com with ESMTPSA id t73-20020a81834c000000b005ffddb2369dsm2618483ywf.82.2024.01.29.09.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:34:20 -0800 (PST)
Date: Mon, 29 Jan 2024 12:34:18 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Nick Alilovic <nickalilovic@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: Re: Pull request: u-boot-sunxi/master for v2024.04
Message-ID: <20240129173418.GA1152441@bill-the-cat>
References: <20240129155543.2439451-1-andre.przywara@arm.com>
 <20240129172449.0b9ebc9f@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o21KAyWGNZ5OpIQV"
Content-Disposition: inline
In-Reply-To: <20240129172449.0b9ebc9f@donnerap.manchester.arm.com>
X-Clacks-Overhead: GNU Terry Pratchett


--o21KAyWGNZ5OpIQV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 05:24:49PM +0000, Andre Przywara wrote:
> On Mon, 29 Jan 2024 15:55:43 +0000
> Andre Przywara <andre.przywara@arm.com> wrote:
>=20
> Hi Tom,
>=20
> > please pull the sunxi/master branch, containing the first part of the
>=20
> I just saw that the CI pipeline failed on missing maintainer entries for
> the two new boards. Is that a showstopper for you? Shall I update the
> branch, or would a follow-up patch be sufficient?

I've fixed this up myself this time, since I was doing another CI run
with this for other changes but in the future please fix these errors
before sending the PR.

--=20
Tom

--o21KAyWGNZ5OpIQV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmW34ZcACgkQFHw5/5Y0
tyykswv+Ie9wTeyz9icds5xcIv0dw8+TRYhFe+uKrjcZjRE+mbVy/AP9VKKd0xAl
BIh7HQIiDyd6CCNZ4uq8eFyEUFoGeqhy4KzgJo6UlZ97mVHYskdUuGoQ/3DjRqLA
fDHGwkFNkazIXgy3rsCfdP0dv9OUXvI4BdiIIcMQYZWIIzcvmHofYL0m8j5hloa7
xg9xzD7GVd3nDBDfTS0WvEBIenZuEsgkzv8y9ML5vwDWDPermkykwLi/UrfopHLs
FFk95Eb9n+iSizftxQvd8czBHCyXOwaSVDou587lJq8t+H7lVnn+i031wnARUffy
gltlUtV9nh6uoWLf0U+xB9T/09GNUusZgKVOWm26d5GN3Y8SREnWv+HKEwIBP5Nf
ZBzJMim4mD8sx7OIGUO3hgYoT0KkFEjvViSpfNqRZEpjQGMhowBRcw+unJQULRX4
LTERrB6xQ2ClUVEPH8oOLk8w8fa2ImRbIvfg5qcEsgBP6S+XgqZD6y1hIbqSpnRO
7VMeYEUw
=ClI8
-----END PGP SIGNATURE-----

--o21KAyWGNZ5OpIQV--
