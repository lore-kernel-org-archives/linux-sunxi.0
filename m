Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB5262D38
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740421960; cv=none; b=B/TzBmzJ8gDnVgy8ffAsAcblg6nkIf1PPNhTC4EHameaOXHjzuTC+rwrgA7v48A+XLUPF9dcetVLyXQi1ob+AFQReepaeFpGnRaKBwPBm1TY9AFyQtu+OgljmbZyd8zoHGE8+Tu84jAsdC0eGcZ368UyULxxdrRi/wRqoz9xHVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740421960; c=relaxed/simple;
	bh=98uB1rbdWm3A58E80bor3xFULFwAE6GtkDVd4uWUY2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJFROk+AX49BHKBFCAEtIUR/NZi5EqFpw6xp6G2FSL478arw8b10FtB3Fja2o/mvFbZusSlScQTbtjsjB/y09bHv4iP7vp7FzWpPllVCiZqY+wWix1h4lXYP0xU5Ftl3vea5Nyxvbd30MWIjksPW4tO6O7LB31D5y59rItMNeKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhUNpb+0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhUNpb+0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5439a6179a7so5299187e87.1
        for <linux-sunxi@lists.linux.dev>; Mon, 24 Feb 2025 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421956; x=1741026756; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N39GuLsH/GHnLWfi6A3DaLvaYCvcqGiUvrrDOML07K8=;
        b=XhUNpb+0hCPmI5DLnSPgkTXVtmD8dgMA1d6we9sI0LBTCDdx8WeauPwCnDx96Xt27S
         JMuucZ2BJdD5dNOGSuf21P3SsWZFh85WoxH5FeYezZ71fjpmyK3OcDgPFuOYfI/Z6l+2
         GDW801WU/upnks9BpViWgH8gykd35dDO/os/M5NkihrzZtg7iJR2Pp9KxwxAFr/NQlIs
         FampmnzkKyjO2Iti0Zt3KX+2Pu2iWkbOtNPb4ueYSvjuRryNCbL7fvm5q8kWBhtZAMXY
         6VhRQbaQZbPXzC4G+2wydcDmqPn84dUz+VvFC5WifucYTLLPgO5DogreypO5jzxfhfHq
         qrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421956; x=1741026756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N39GuLsH/GHnLWfi6A3DaLvaYCvcqGiUvrrDOML07K8=;
        b=sEYb2nnoU08cGXKMTvQ8YGPtYnDglRMr+Q6NJDaIYSNKF16LaleIxVe2VY40oFs8MA
         kq5EYQQdwvoeL/YGML72KSJPAM3q2OJ6zQI+XEBPNVwtgL+xPi9SMZ4cun2l89ZYdLXo
         k0aAfuRi7a0vQ52EtNhpKwSyocJ9Du00FaiJBk2naJNxXrHua3cWk055zCPgSuHfgLgE
         NDwxp27z0pHAy1AMPDxPv6Bhr5J0bOBvkXku2D0+b7SEQvojhOOgXJpC9QtsHacF9Q/8
         St4W3dU2S5YIk/ONe278yBfCdLHowG37lvOCONT0ahVj4REmYut9NTkoHtVHSW6QLpmo
         IDpA==
X-Forwarded-Encrypted: i=1; AJvYcCW+A4jqYyok3bygzawNly0mTNa6mRyxclh7l54tbVOviN3275kLM5Q3jH3Z174CNN9OGRL/9Os5ggRLHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXzjznnaRTzuESBLJIussq18EnNNlfJvSiEwXIMNrPkzRu9QsI
	BFu2WTnj4KrnhUB9+73PhPFHnzRbLlm+fLv4vHha2ibSLOgJjKzW
X-Gm-Gg: ASbGnctOw8/LZ9Q1gruCFePc2Bzl+zX6aENvttFNKvMrwejd6dS8Rooim5Vs1bQTcwI
	PkO5puRE7l9jjJ+uX+2CHhCifiWdQ8AkeYgaFRVLs1jhIHmbJBstOEnH1vP0JXnwnfEJHbB4RXp
	0y/9jRi341d1ULUR2ChKFukfIib0PdUWywD8Cg+WGDWmgPyiNrbDf61ZrOiGDco+7liKznZjOCZ
	6ov1uUghTg1y3ysq+TDHHkM2YNtoDA4Lav/3L3+DL2llp9rp7MajGC3DpaytVmcoN1GZWc7cItb
	GXinx1hQg8U6P09tW1uf4DbtqSpjsTVb
X-Google-Smtp-Source: AGHT+IGuoaXIvmZgefmGuVB5f6nZE8zpUKpcTq1FcueeKygwj6PXc2F3VGYVqvK8LafWdWjrrE8P6g==
X-Received: by 2002:a05:6512:159b:b0:545:fdd:9ef4 with SMTP id 2adb3069b0e04-54838c5e1bfmr4544720e87.8.1740421956169;
        Mon, 24 Feb 2025 10:32:36 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54771f058casm1259809e87.188.2025.02.24.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 10:32:34 -0800 (PST)
Date: Mon, 24 Feb 2025 20:32:29 +0200
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
Subject: [PATCH v4 01/10] dt-bindings: ROHM BD79124 ADC/GPO
Message-ID: <4d390ca96434a8ee35c0c850cfe4fd49e99db653.1740421248.git.mazziesaccount@gmail.com>
References: <cover.1740421248.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OoD2QNHpBXvMQxnR"
Content-Disposition: inline
In-Reply-To: <cover.1740421248.git.mazziesaccount@gmail.com>


--OoD2QNHpBXvMQxnR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add binding document for the ROHM BD79124 ADC / GPO.

ROHM BD79124 is a 8-channel, 12-bit ADC. The input pins can also be used
as general purpose outputs.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Revision history:
v2 =3D> v3:
 - Restrict channel numbers to 0-7 as suggested by Conor
RFC v1 =3D> v2:
 - drop MFD and represent directly as ADC
 - drop pinmux and treat all non ADC channel pins as GPOs
---
 .../bindings/iio/adc/rohm,bd79124.yaml        | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml b/=
Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
new file mode 100644
index 000000000000..503285823376
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/rohm,bd79124.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/rohm,bd79124.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD79124 ADC/GPO
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description: |
+  The ROHM BD79124 is a 12-bit, 8-channel, SAR ADC. The ADC supports
+  an automatic measurement mode, with an alarm interrupt for out-of-window
+  measurements. ADC input pins can be also configured as general purpose
+  outputs.
+
+properties:
+  compatible:
+    const: rohm,bd79124
+
+  reg:
+    description:
+      I2C slave address.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 1
+    description:
+      The pin number.
+
+  vdd-supply: true
+
+  iovdd-supply: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-7]+$":
+    type: object
+    $ref: /schemas/iio/adc/adc.yaml#
+    description: Represents ADC channel.
+
+    properties:
+      reg:
+        description: AIN pin number
+        minimum: 0
+        maximum: 7
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - iovdd-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        adc: adc@10 {
+            compatible =3D "rohm,bd79124";
+            reg =3D <0x10>;
+
+            interrupt-parent =3D <&gpio1>;
+            interrupts =3D <29 8>;
+
+            vdd-supply =3D <&dummyreg>;
+            iovdd-supply =3D <&dummyreg>;
+
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            channel@0 {
+                reg =3D <0>;
+            };
+            channel@1 {
+                reg =3D <1>;
+            };
+            channel@2 {
+                reg =3D <2>;
+            };
+            channel@3 {
+                reg =3D <3>;
+            };
+            channel@4 {
+                reg =3D <4>;
+            };
+            channel@5 {
+                reg =3D <5>;
+            };
+            channel@6 {
+                reg =3D <6>;
+            };
+        };
+    };
--=20
2.48.1


--OoD2QNHpBXvMQxnR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme8uz0ACgkQeFA3/03a
ocXYDAf/aZy7lHBMV/y8BQfayGuvRMNa+yzPpPHq/dU6XF5PEhMqMJ3UsVOhR+1d
UGxrDIENa7xyOPAw3ixngeMix77PFLLj/SwSFcDID2NWy5h8HsjTPdIlPZ+/2m+N
5f7BlMlr7tJYGxTerh8S9zrB2JjLQu15lX9FKyjbGwyjBeLJNLur6WyGPLVKxlKC
lYtZN4TXAoU1slNTQkNhaOeJA6MBzokAx0R9Le6wvULUuzyEykpl3k2ULVnOXR8/
zSGA8NBGCgJYExdvpYqYy8x9b8yZec+Lz7/OxFKuylNYCSm0E6K6nNJQY+9V3Pt2
m0cy3LLxtBGaVFknxcgYneSUA3z7iw==
=70g3
-----END PGP SIGNATURE-----

--OoD2QNHpBXvMQxnR--
