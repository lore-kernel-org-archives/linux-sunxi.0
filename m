Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB61BC094
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968221; cv=none; b=sMAGm2Xukxdp2kz7I3YyinIcIqG3LtYi+0QvsfllRQs+E0QRrkQ8Xdrpxu6Xsxp11ar81yomn9HrcHrbTeO5TxjHsEHMxLXdkFeAKUbaCseXN+r4zme6fGQY0nPs3TYppO621MphAqG2l04Cg15Mwu6PxlqW8+8AzwRAcBMsxLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968221; c=relaxed/simple;
	bh=3gWSTns6gMmB1JQU1DSavPgSrppmWBtW/fPGFzLygso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8/2u8RQjo+U69P6Qfy4Nc5kGIbcHixkhWWLs6aMfpMKeVJgAmgOySyDmijLo2nwCxWhc/QuZqpITuOxlJxYlVBA1HmjsTmxYHqLyuD3XWyLHcZNKbIfnDX1qHg1BEWO00vXYrkuajQktVJbc51HU1bD1i9GEk/rE+gnX9CTlqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVOADf6L; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVOADf6L"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30797730cbdso69559241fa.3
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Feb 2025 04:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968217; x=1740573017; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1hUrd+Gyy/ajIhuvrP2MqW/IazkO3sAPZGITYXZm04k=;
        b=RVOADf6L5I5IUO8plBrbwSxVldCIo5SYJOCSqOVP/MZE+ZHCRljC70bAxq9XEAzxcY
         Pe1/ne32/3MTVDUprZ5dlcOKihJIAu3PrPmzJUjCO1w971227mDQ+wvnk6IcV2+IAKeH
         2fFBA7GwtDK0elUdkkLWM+rGWcT+XInu4lnklz4dNUT4iZ3rUFZxKvi+m3dxBOlaMEoA
         dnT7H3oXxEn64XvkuiABeDyaBZZ/JFpVW7AL6gPN4bF5QH/G8VYoAx0AY1EA0ALPlTC9
         MBvJCgj1y5Wn63suj+8tBk82OXWNg1Bjjsz7f2tGASGEO07meCWPfmLM9AxvxtGHw6hq
         tjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968217; x=1740573017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hUrd+Gyy/ajIhuvrP2MqW/IazkO3sAPZGITYXZm04k=;
        b=M0Y1wxTF+sAgvZKR5GqkpsbKsTIgwQZ6JBXnQTzUh7YEkbkSs0u/SegYUJ9FpjaLHo
         pVQEjOgAzWBeodWpZgVsvJzMmAfKgz2RNjY1WTaelYlpOhMC3BIzTmc/3n8BU94hbwqR
         BHdD1hYHvhOKVOdgzE7cKFHFxgNv6BPI0H+Kvb8bRRh+8gPOgdCPXJu0M+kXF9JjYNTq
         sANBROdImYFIYTyZ1Qrmeo6Y/Pk8hcjgUEpqrCuijGfvMZO2Y5mVvRNfNMGudU6kk8+u
         N3msVO4oM+E2LKujy0umNNvB69lmvmYI5+g6kpmCRplarHwzb/mZaCqU1S3i6PN2a/ck
         8v3g==
X-Forwarded-Encrypted: i=1; AJvYcCW/7Yycp3aUbuaHY0CsX5bm+648zDq87RIRzp3z13Ie9Le/qQTxwLaTjol6ELbSuvIKId3LSQunWW2S7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEHI7CAhpyhsPnlcxKAc2WuGYIMlxd2rutNth4YR4x0fC6QAIG
	erArBmmXsQU8T+aGsNtcyO9I8xo/xAcFG43p+c1ctFIvpdMINCUU
X-Gm-Gg: ASbGncsiCoSesJPniij626/sXr3dY9lY8EMV83hL3UveYjybzuxdnYGmjVWWxFI+7E3
	+Ng68f0O3BKK6vtPKvHADGU84uQB6BDQ+gfbu6Xqp5/lJcsj/Jv/MqvBdbAcKcj5PFYdnpve1/u
	rsew1xxdyIMNs/MfxfD9gYyrtFG6G2FZnagBIqPRscRtN+LKxMTScpX4aAFSrhShd56wiLq/bC0
	8CRZhBpkOs/UxX2t6TrwovsOXO2uqDSqg66HLdprCX456mjc1y3clvEgeV/aUDdaSjBR/7kt4QK
	CnGu9UwAmBzMxZM7cPODpg==
X-Google-Smtp-Source: AGHT+IFF8ZAOezRn1kWhpmBq+gPrOLGIPq15CfW2c+RFEDW/9HuXUxU0qk6Hp+MJg1WFZfej+FArLQ==
X-Received: by 2002:a2e:b176:0:b0:309:25f6:8dcb with SMTP id 38308e7fff4ca-30a44dbb334mr9639561fa.5.1739968216796;
        Wed, 19 Feb 2025 04:30:16 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309e57cc68esm13923301fa.114.2025.02.19.04.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:30:14 -0800 (PST)
Date: Wed, 19 Feb 2025 14:30:09 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v3 1/9] dt-bindings: ROHM BD79124 ADC/GPO
Message-ID: <52db5ddb99dcd8da847f8fe595efa74c3ab1573c.1739967040.git.mazziesaccount@gmail.com>
References: <cover.1739967040.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R4M0D4QEb5Wt72s2"
Content-Disposition: inline
In-Reply-To: <cover.1739967040.git.mazziesaccount@gmail.com>


--R4M0D4QEb5Wt72s2
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


--R4M0D4QEb5Wt72s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1ztEACgkQeFA3/03a
ocU2GAgAi1f9EhPjwB6NYTSl71jogLZMg16q4DlOdHT5/QC1eZtxXbrJF0fqBJ9b
ZYymKkMVy3nlmcL75k/CoKlQFQyDLmJ5QG/bb2TsI8P+WvTTkW/njLa9K84ZC2cB
rd3U/DxERcFfHZc2mCrJPIWsihlIHDcISg6dN14sjtv9EV1aSj4xufwmOxpqSmLO
nyIjYvI3wPWsrxUCm78ukA02eDjmyPnXQwI5D7vANv4YSaoZf9PTYZ5l01iWgNw1
mwKjV9GLgBtz4p1+5TJ/R6+JT01hf6lriq6oiPL4Uf6aWn8hJoUbrceEk6ZXCj9F
sZJB9KYXRQpvgzQpYoLYwhSzkJ2YGA==
=A04d
-----END PGP SIGNATURE-----

--R4M0D4QEb5Wt72s2--
