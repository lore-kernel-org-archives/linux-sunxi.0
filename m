Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D3266194
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422108; cv=none; b=JecSKZMs1XjcYShwrqHpftilGk+lL1WJ/2G5DM88JojiE6CQpHPHRr1skTtXkDWQ9E/HRwIF41/Az15FMA+0SD2W/akUTJYOp1ZvaFnRLJPYxhYJYdWjQPaXBIgN7xxBg6NFp230qO5BPkJAD5KnmNYxDjmAwWF1NpyDxAxEfYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422108; c=relaxed/simple;
	bh=v5dvf50xGfv6+dkwMCERzgymEzJAyEQQxvpFgU80674=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZgffF9rFPWzWv0F1kaUWhqSqi7Ut5DgHOqzR3SawlZ9nVPf09eNnPLUoPZlp61V4GSAPyiQtgtCiZOMjv91vX3XYwNwydLmA5wdO2AspVH+6FMlaiGcfEk+/Goa8A+7gCHsG51tbeCjSqKPcOv33UIWmbqjmlmYFll76PaKs/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hmd2D5fO; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hmd2D5fO"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a6bso49680251fa.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422104; x=1741026904; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wB6e0LbXYe7xZo2cDjAU++WyYsDziZwYbdBjD9+h5AA=;
        b=Hmd2D5fO7jXObsvs1pKeRaNmM6F1Kb8maj01fLdAkJQT4e2b0145kob9ZQlHmnaKDi
         S3fZPCNp0hUHFFuez0X9na/tVHgLJkgKuEPQq/gweqBIbZwLZ1v5/UtwE/mW7E9roSjx
         lWAQ3EU/yUpjvxi0VTLz0vCAVFdtkZ6DfpomP3OPYuKsXrsx0OikagRRdlSlKneYad+e
         M+tLKZnV840lBhyrBoA7nYiCTq9E2nI/j4ZZfC5Z8+nlBhTdbca73uc3ROGTaHRwC3Nr
         4kuvKD3t21sTqs1Rfy9Vl509BW8ZIeEodaL0ZOomC4B8adsDAS/GKwvGYgwKaRqhSvJB
         y3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422104; x=1741026904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB6e0LbXYe7xZo2cDjAU++WyYsDziZwYbdBjD9+h5AA=;
        b=V6zGJ+es5YyLE9ZAS7Kqf/L8ttMN7IBIvJvOnUHqTh6TeS/limysUf2+OU6UAwNdXx
         /TQ20xWWxr87iBFePBx8Uo6b2BfIRvgUwd2TcdrGAo2f/kDgz7OlC+CqQns9/67pjMtE
         K2EoZ+nDuA0LqWE1YWbKCPQtFrYfB4dEOBqzJbBn3yruMB9g3ePRy3qUdod0Kp6Tlv3p
         q2W9wU3gDKoaiIuI3TShBWB88c3S5eNVhWl2nScKl5zJkTUrqm8YLrzpijjVjnxN8fmp
         ZjxMDJC/Jx0jlawt7UEFweNrAxB1TT3d2SylT0hIpt0cZwVD3KUHwNUe8WaCZuhE3En6
         qJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXPnOhk/hWylrFDfxscx8JxU6HnT2iLkSKy/zyXydgw0NCzm3NVCoPyWr9CanxP96jAKlk0UXAJjnIWWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzj7R6lhTdDNPCCee9KtWC9Wb09FIHCe4v5dq0bgtp0zwAJHJc
	TGlzegQKXNvmA4eX8LyNKztOoRPHKky8ozPQwNFZSwQebB1WJaG0
X-Gm-Gg: ASbGncsKELc8zxTw86iQ/29i2PPyAXpeUYym89DYgMXjtcxtdzXFQqn/+1faADPhQOQ
	MgA6b8VpnRKFzFhLz0l+vLEcBzJ2da/14KHaLPFWOoRLiGx4uV8e20eG/R6OE3MtefROq6ye9zT
	Sz40RUvC7ET8wVq9q1SUks+A+EuDm76yRNslgnFd8ioJuEjk4GG7yxOLOanjPvASOu/RqhOP9Mz
	l1KC97mPjqh2B6cJ9Y1tSTKpIhGKGHzmXeSqMOeHd2BrtbNTCjkZmErXUwRKd0J4B6B8w/hIkQE
	A7QAwfT8dj+RwDYzTJTFolzhUc5Igu1v
X-Google-Smtp-Source: AGHT+IFs7Y+fPcBuO8FWsGzVtgW29xKLHKqg2RgdPdKlbhb4D5IMevpKDqe0ksSM6DR2potkoMrNfA==
X-Received: by 2002:a2e:81d2:0:b0:2fb:cc0:2a05 with SMTP id 38308e7fff4ca-30a80cba36dmr1382731fa.37.1740422103756;
        Mon, 24 Feb 2025 10:35:03 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c3esm52791fa.7.2025.02.24.10.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:35:02 -0800 (PST)
Date: Mon, 24 Feb 2025 20:34:58 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v4 10/10] MAINTAINERS: Add ROHM BD79124 ADC/GPO
Message-ID: <3d7ebd442adbba2719c6028308571995ec10f468.1740421249.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SgT7ql4cmjy8U+5H"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>


--SgT7ql4cmjy8U+5H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the ROHM BD79124 ADC/GPO driver.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
RFC v1 =3D> v2:
 - Drop MFD and pinmux drivers
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1821fa8099b..b116a497d905 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20533,6 +20533,11 @@ S:	Supported
 F:	drivers/power/supply/bd99954-charger.c
 F:	drivers/power/supply/bd99954-charger.h
=20
+ROHM BD79124 ADC / GPO IC
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+S:	Supported
+F:	drivers/iio/adc/rohm-bd79124.c
+
 ROHM BH1745 COLOUR SENSOR
 M:	Mudit Sharma <muditsharma.info@gmail.com>
 L:	linux-iio@vger.kernel.org
--=20
2.48.1


--SgT7ql4cmjy8U+5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u9IACgkQeFA3/03a
ocUZ1Qf/T7ozsozyLKeP4mSUdzZsJgJMWnZtn+6t74wkU985+m34/PssYsyOgyn+
Z7JbMjLgd6UQxIoSFaswLl+lNarmqyDACVdrYY4MBivHyFsoPlheMNal5+9IKbpK
rklDqPdlKPuBH31oEX9gi4UpZqiZ/xSpJSR34czNzWgfD1E1PnjC/dCjs75zRUqr
ZlrC9O+eTKjOU36Au17YE+uIZenzVv0Xb7dFpkFr7GwiuX4q7TpmAgodk3AqfoXq
MWa3zS6UgTWRfk7uC2rGaq6CVDnPkf9ozF2ePIJyP0FkKQab+qiYOcJmqBo25cPU
rNO7SQR0wwART+pZH+q6w+G4ARMURg==
=LnpL
-----END PGP SIGNATURE-----

--SgT7ql4cmjy8U+5H--
