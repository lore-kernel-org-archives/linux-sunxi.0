Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA721325F
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Mar 2025 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458945; cv=none; b=kfhrw0Nbc7kWUh29HBe6b2FJ7ZYY2H/QfkXmlYCt98K3qZMEplFMnwdDoFNjuj9XJ6mjT4mRK0Cu2U1UoJTC68lesGwsEWpadaA9lynIP24HT7yTPFfyDY08idT/zLK7wPz3c0IYY0smkiakJWya8ZGBp8BHnfJa8wU394a5Eas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458945; c=relaxed/simple;
	bh=LcKythHWTu3cvrkJmA/M35tDVU9XgXQ2PjiWeTXt5E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1j52eozt3HknvR1nRlqSD+nSYVj83dAjBYeqkXCiX493/FCswsA9vn8vVrf05WkYHw+/KUSbypBmMORn4cnoj0xLnvNRyL1ZT0nX6zDFziVUhlMnE6LpYVKYPxaS/HCZPmrhuiOgTAyrWeFX6nOwGmSBqywEFNgbHB1IZHJnOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPdKyBJz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPdKyBJz"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54ac9d57173so1787244e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Mar 2025 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742458942; x=1743063742; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmd/n1xd7k2T8XMZPqYkLOsLsUUybFUobREHXbcUvsY=;
        b=ZPdKyBJzI7ldDcw4tZuilFEgxbqDDtoqc0A10k76NU9urgixZXetVeCJwhp7yEImGL
         zENQvILt4mAKjzgsI2QGjq+YMfZh46x2yWNa2X9gpucPAlnRhceQ88d+3wjM8AXybLSj
         yYVGGrjWSxi1+6lTh1TY9Rbl9tK7YVCixHB6taTmKjV8eoVPwV8Mvc0VWUCdtBQpp6wa
         B6fZYv7XoPTPCWdefmlW3stOQNAXrHMtUP0EMtQqSbWJZCngdfkpx1+pHxWSw/310q+9
         nKXTbvq8NDpR5ZYO5vFntlbo+e7wgVHa4oxPDXTY6KCPgSJB2CPkCdgz2HrfC4PZXG/5
         wg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458942; x=1743063742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmd/n1xd7k2T8XMZPqYkLOsLsUUybFUobREHXbcUvsY=;
        b=wUJfiKm2VFuB4IWSREehNvcuQBQbYqzGd4C9/5Z+DEL3UzfrjlVoIG1lg9TklNKGGx
         n9RbGkFKAjBH6zyZMbl/ndRaYXtiqNSS+6S1q8hoTyUjLsvFus/diB6tvpV7thrZLAwr
         V9ZFHHNeRWqNVXNmRJyN10rmfNCdC9Unt5yP5Md4qYkqVRGwliY7PAKFFiR3aXTmBKAQ
         OA1XZ8pUTTkvUKiP5sZZqyy420/65qiAA9aT4e6wk76OKwhZTIio6QO3UsxmI0wq+lts
         cF1AslNvP8VKCqtUGU0bySqz78yvZil5qQumAq7Oy39V3Og/HsPl9YLFo4ghDFOKU84v
         VBNA==
X-Forwarded-Encrypted: i=1; AJvYcCWEBRmQdr2KETmDyW9G5o66IuvGG+n+dDesbyHjcKXWLgDf3f7IwA5lGF+Js2WBWZslWpfA4lkk8puvpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBaFZOeVvb53zS6AJCvG2aCi49P+phoZV9UN6UNKSMniTFufnD
	A4eATfaGAEzNYMtr8p/HmUIqk2/DYhSXyv1vqWgZTJkg2+V0OVCR
X-Gm-Gg: ASbGncv4Tfpamq1/ENtyVyPL84nodpKH8oWAmN4ypY2RJJy6fptjHma+SDzzf1c15L6
	Ik7dr5YiTS7889y9LnH1K7e6MPOjPjuC3A/epRYy/+MEkScEhp0+/hw2GPfo3TsO7yrmhvYkkZx
	fvws3U2PZO9+5h8eeIVqsqdasj+bi32qzUOExMzci16QXQOyJyz2EbMauPCF1Bsv84d1H3hA9Uk
	HdPe2rflaztyXmg2vyYSAgLeJAeAnBgQMnkPvOkjlTNoGXksZgbBnZ/XCTiokZMF2IA4NSyPeo0
	Lmqjxohzct5iW4Mu74/uhKVghDQURJ3PznJxAfj+LDW5vwomINo=
X-Google-Smtp-Source: AGHT+IGN7jQq3CGHj0RH91IeY9Q032+tQbArvaah7gKQeusMKWEMnoW/5Hlgr2n0AqqsWIEjFWFNPQ==
X-Received: by 2002:a05:6512:1596:b0:549:981b:169d with SMTP id 2adb3069b0e04-54acfa81f3emr851829e87.3.1742458942033;
        Thu, 20 Mar 2025 01:22:22 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864d7dsm2141832e87.130.2025.03.20.01.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 01:22:19 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:22:14 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
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
Subject: [PATCH v9 7/8] MAINTAINERS: Add IIO ADC helpers
Message-ID: <c81db29201f10b50f03971bc43fc6fc1c63ec4c8.1742457420.git.mazziesaccount@gmail.com>
References: <cover.1742457420.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LU4zmYhbxNu61z52"
Content-Disposition: inline
In-Reply-To: <cover.1742457420.git.mazziesaccount@gmail.com>


--LU4zmYhbxNu61z52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add undersigned as a maintainer for the IIO ADC helpers.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
v2 =3D>
 - No changes
RFC v1 =3D> v2:
 - New patch
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..5b96fb864227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11208,6 +11208,13 @@ L:	linux-media@vger.kernel.org
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


--LU4zmYhbxNu61z52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmfb0DYACgkQeFA3/03a
ocVHKAf+MPHPcl8h0q9Jo2dudYpTD2nDzKrEj8KICCiF9YQvvTj6RSGXVd9Z6GuP
wYX9UYNaarCpcpiEwOh3jytWvUcVHt+9fxwz3Z4ObFLXUqHQTg4ymKwT2zOWUDYq
6ukaqXl+8NSVAoXVH4FbjfZsfiMWb3TeXdckgpEBCBIl9/rQIzf0X5V7H8RQke23
P0gNLTiQJI4H+OymLXMlNYIkVPaZ2JFwEuiP+ZHYyuJvOvj4MOKT7t5coSbcs0T6
JqoYlU/55pcjASW4oTUL7VhWMjnL0UXLJLRjLJjJwMs1/iZuwpKNXrTKKYewEts9
1tvceWn+PujhGuuNVmJTjoZH1mnJNA==
=oGui
-----END PGP SIGNATURE-----

--LU4zmYhbxNu61z52--
