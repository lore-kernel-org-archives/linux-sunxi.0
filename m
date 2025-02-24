Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D026657E
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422094; cv=none; b=tIADI1lQGHi+6mJ8v4pnfA6LBM3QMpwO+o25VSCom0zGM9f8/QRi6rjNCLFAEhthNmAA7tFeposNpYYJJhB8Tb5Iv3nqocgttwmqEP+EjVp1w3/ft6UrJ3AANF8umKznYmGPzMoXbZfkDooTZ/nE7KtXB4BkOJF3qIBNUpP55b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422094; c=relaxed/simple;
	bh=4jFstp2yKjGUClc2MbKgYIcVr4Bcc0n/feD0l6rPrxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9NvRB7FR2l5zGKSkAvJG6Kd+zOpAywFhoIWToeJi7BGbeZsMtjTxw5QYf0Mluhcu44Jus89KvTkZTS7kBH/nmjHH0n/HoGaW8W+oPX7rGFtxT2XTfNLonyKdDji+eEjIMNBSHhyhF9RAecswPy5vW66pNk+vwOlX37E8eHLIuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7BMfQMg; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7BMfQMg"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30615661f98so45764271fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740422090; x=1741026890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIkYf97P4n3NLrtzlwokY4ULnxlvFjbpCf7nMOEO/04=;
        b=L7BMfQMgkqLH5nddNpqBuXuitlEu5ryeNQgcBy3SGutUiBUCsZ8EEkUKCAEZoX3/U5
         x8dLOh67cTaWZ1CYj93BFO8XyjqUH2GZaEKLQTspf6WYy6YHaHrN9Sh3cmK+HbZeaxc/
         5gsgAnOjyAOA70+VE8zCCUakzLc1T0Umsy+J9FQaXiabVSxUwx3pc8NpvVc9PHNqYCaU
         7zPqC4vB0US281kgJy/w1jI40UyTYW5mez6IsazMZDaPoJzu/TURnUiuGHdZW9ezEQkG
         z5kxgMROH65lCtI9wTI9gR4+jYyfBrzTEImX6IEgzgTsJqmdH02mWDeWH6us/hjG9vnq
         R45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740422090; x=1741026890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIkYf97P4n3NLrtzlwokY4ULnxlvFjbpCf7nMOEO/04=;
        b=N8QYlZY2XK65r7IyyXjhG07SeKIr2Xz922c0WJ5OKNmXMMlPXNuKrIg9ER4xPQ77+N
         +3WY9dxLgo8QqPmyxHFCIEsbpfbz/mIAkvSM9yD0otoQ9OMLcfgsdvkhR/zJMWouj+mr
         3CJ6XfxWPEFdgiEopNZ7/YeHf6+GPsNzElhimwDsJsb/nryfQq+TSuhL1NZ7hN9rrzO5
         +WI+AAL7MZ8WDtogI/ieZzyxXpTAzR0muX01zz1XiVZxiJ2Vgmz7V+l99RCEgPQIzBXz
         DYDeFTR7Cf9cxdy9uyKR39p+lDyxm3dF6XrfJUkpu/Mh2TcPMp+dtC2C1nEYP6qMf0gx
         HiXg==
X-Forwarded-Encrypted: i=1; AJvYcCWGpySZVbb7fbBNQlpR45ZeMExZ5XxuN7y8mxDZ2wenZxRc19Nw+aBM+UfTVRJYwaYk89H8hIDl/WUirA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1p2QIsl1KCVP2MI2pKtDWpNMym65HGkQUAg2i07l3FWa6Nzeu
	JgC4vGVwBc+NBxOKTUfwERpTeJm1BiPBR7wx8PPsMA2k31Xg6pXY
X-Gm-Gg: ASbGncsm4rZxheyPUuTVBcptm0Y3HaQrD7D/BhVgFR+aB1xxckYn9oTgtKuM9nRvwcE
	58C6K6v/1kFJO47mqm+vt4bm7eY1x9G8+R98vFQY3WTX1pL5qrNyvPWmfV88/LBZXPoJt8ebneg
	w7TbvbI9hAcJG3yjTuiLVxHDItOiOnIVzxhlcRB9VttxmvE/oKo5AFNKdGNpdwFbw+QZNays4nQ
	JQNIWg30KWEP2JkIROQUEUUtuKmd1gRfjJMDaDAFqsRK6WIetHd4tSZ86SOQXC2GEdoqCDmHsI8
	82g9Dxd6PQo/kaUGC4YNXsvAbb/0zvcV
X-Google-Smtp-Source: AGHT+IHlnu2JCoyY3lnko7RRFUdy6VX59uK9aMyzAe5hg6Irx/qYyxzQ9YwTyDI8XMZofmwi5dO6yA==
X-Received: by 2002:a2e:b8d1:0:b0:309:2627:8b04 with SMTP id 38308e7fff4ca-30a80c247d9mr1391031fa.9.1740422090039;
        Mon, 24 Feb 2025 10:34:50 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819f4f4csm52781fa.61.2025.02.24.10.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:34:49 -0800 (PST)
Date: Mon, 24 Feb 2025 20:34:45 +0200
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
Subject: [PATCH v4 09/10] MAINTAINERS: Add IIO ADC helpers
Message-ID: <b062f5bda18027f0c0065f2188066857f8a7d573.1740421249.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="79e9OjSnaY+N0AU8"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>


--79e9OjSnaY+N0AU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the IIO ADC helpers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
RFC v1 =3D> v2:
 - New patch
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea589f..c1821fa8099b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11200,6 +11200,13 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/rc/iguanair.c
=20
+IIO ADC HELPERS
+M:	Matti Vaittinen <mazziesaccount@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	drivers/iio/adc/industrialio-adc.c
+F:	include/linux/iio/adc-helpers.h
+
 IIO BACKEND FRAMEWORK
 M:	Nuno Sa <nuno.sa@analog.com>
 R:	Olivier Moysan <olivier.moysan@foss.st.com>
--=20
2.48.1


--79e9OjSnaY+N0AU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8u8UACgkQeFA3/03a
ocW+9Af8DzpO7JQvFk19s1ybEKwla19U9LNwZ5BXpTh5F7Sbx9QSapqq4w5p3Ijx
n1Nbw7YsRZQbIYwgPxStUkCvZBpBDfJE13MTYfUxkOBeOGCVMAAnaCnfEkcxGh3Y
a925YCi71Zvym2z3CEYACgy3xnJJz9lcIVJJxGgd31r+SU/WLJOl1Pz4I0y4rGDU
H76m8ZBZD3J4TQXZ6Tv2pCGQLcHC+iwBBusM1gdSUiZLaPOSOBajG03Fs/WEF5VR
sQJ4h6TLnt9o4jAi6nWhACiOJCr7mRl5Qk9MtmA41fvdOtLbVLNusbAyBg/SxvHp
5gmIG9ti8cVRqLbOOZy1Ht2BGlxwdQ==
=2wGR
-----END PGP SIGNATURE-----

--79e9OjSnaY+N0AU8--
