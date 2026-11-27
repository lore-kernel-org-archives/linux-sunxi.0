Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775871;
	b=CmL1OFHmJeT2dkp93NHj5zsncyCBoA3urUGHTJhPaGT/F4G1N5VVynSSP9TGjIOfu7l7
	 2AR4HLhi+gDo66dYOWXB/fbuXLoCHxyjp9otf78+pm0sKsElEBzzC7oEOoeWiR1pnYvkJ
	 IIMuya1N/SW+QtCWVvgP3ydqDFQhYC6ycBJgOzIWYVdV6wVrX0ak3Dg3MEvS6+yIacsmr
	 /2x66kN+21knXzUxYa1FppJhjTAzdp9CJz6URKEei6a5z4P6+7xinCXV7cj3WNNADZs0w
	 V1Zr9x5sdyNS8LHoZ1Z1tUpZ8SwPoIMZWlxavctsHR77dIWhbDCjSowaIflCEVGhTMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
	b=FTH95LcjuevTcrXduj1BU6RlqeWXbF0TTYw+1QEdLGO88yBDXnaJDRN11j+4sGhjjFtc
	 BLFaYdqvwbb1K5wP+Kl+wq/yoXZV9ZQiKu/KPsU3feoz2C+MOmA6hz1MTvRoDE95nioMJ
	 RFV3pM5hv+yi4CtuSI+ApNF1OBwyClA846kJxTLjC5FoK2tUsrTFCMUH2rU4XoHT5iAOY
	 kZwOnQVtqHX0DsLOXAIFKIgQwQpCgRPUTQB4hrqOn5OeJXNy5IghKytEzKBl/tSOwd/b+
	 8wMS3QU4xZEZV3LsN2nfCJKz2i9SKm1XZcEqHeOZzirKjOYt4ySu/NYQmKGwn1QBUUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kIYtpB5D;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179F606A32D
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D179F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kIYtpB5D
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49465892f7bso5807637f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 02:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775869; x=1796380669; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=kIYtpB5DQfudLes7OCgdhQyppbAyVgiHkMOGYGRrZ/Z5KuNunSelJjitmuU1XCy1fh
         nuRqV9UvCJmPVML79NKEtvT8xRY4Iuq338JywVSPJOMlafDouE9pSXEkcgkUMICTwDOt
         HX86lqe17fzLCZRJLXoUI8jee0jVUGqyl7uOVLnfXXuZ9VBVQi/lg95OFIhksn7/frwt
         ORKWQdEBHP13o5tbB9fnElCWIuNizfl9iWELuJiljjd+wH/jgDnhCA8vJyemsf0bKMwc
         dw6gl8rmqMzOhQopvQXNK9K9wDlVrDi+Ttc0jGuO3xAtF8LsZa/+PbDxoe7x/FHRLI7A
         ij5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775869; x=1796380669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC2Iu7WVN9Kv8E55jimB5I9lAFW6apWINO+cxwm+DSo=;
        b=WGjnFClAmSbq7sjM5k8u1X44EE5li0vkBN+OZ/IWfj+sSSWChHDoOyknQsJGqh1ByQ
         mIn9glMA0XZmQX9f7DMovferbRZshCPsK7lQK+qhahf2FvSdWjwPRuC/W6an//zLpOsS
         fw9ZE96VzqRWKJUAi0ar7svcXE45/GITndPyrCVhn0JCpcxZ+HwiGouuEzDr/0ZHThE8
         ujoaG21KkW/S0F+KgwOxR1iSKt2kRy1+u8KYjYeKj7KUDqfzlcGfv+95sMMtEY2JwkBZ
         uT6dGIQVvPUCIglrIfimbkFl4RWwioRDSrW4JvqjGr2170uENOaPc7qHvZ7kjgHBTI2p
         wA9w==
X-Forwarded-Encrypted: i=1; AL+hErHrgM/siD2uSkfjYjoBrn50aEVp9N7OV7EdtVE1aiO6JWQLwIjYqmdXfi2mxqnDDbISt40vLE0e1Eng2A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/SjgoqGkg8Vltacoyc8zFiQBGQEuere9i0MICHiG91FGMks2q9
	D8go7oH7eUTqUOl9J+K0hj0HOeMmHkW3uCzGaTQpy27x5cCEI0vXoz3IhWEbVMJqF2U=
X-Gm-Gg: AZFdTZdevmwFUTRwKZF2q+LegWkqGemiFvf1sxf0C0pXw+Hsa6q6xu4dRxv3eMew8zJ
	FUuCBJgojoatO6PNTQlrEQg4HAmuISUKAmKDAvv29gm2CnxXDDvhflLa5FPvn3NnrsIy2EillkV
	M0kTpnjtx1tlnZ0O/EoF7I9+GJVxwZ8vuqOSR73YKJbLT45jOCN1vef70sZNqzCkKBLV7Kd6X/9
	B0F5mZE18+9U7t8795Oke+klJZDy6pHnM4D2TMW/DCZX2s/yEoRBxcNtjuJIpIn9KVzmdLPi6XA
	84NK5yslIyidXGySZXMZrojTsTnMogT1iBq7R8x205OsPen4UuQ09ulgsLWI0GDB84mnIYs2Q2Y
	PqVv2fS8l9w/1NUV4540NEmwPl7xg0tztZh0i66nlnm8JMGgvyNabpVdR58c+jDAuHT8WzMGBfW
	Ea5RPZD8gfvpVElgAMNPwRyQHejUtoVH0X3iNkQafUePxMGOQkwQvuZ7hFr7CGR9KXqVURE1TsZ
	xFCt1fa3Zr8ocFRVa0ucryAuDt82SLDvkoEUxlMnoJkNePEyi1/94qFXuMuNaGk1X3yNwQ5HFqF
	F3Iad90JsySKoZrHY/lE7SchXbVORGBJ0JVdgbeFbee9YQKE
X-Received: by 2002:a05:6000:2409:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-4aba56f5488mr45494272f8f.0.1795775869247;
        Fri, 27 Nov 2026 02:37:49 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm46609111f8f.52.2026.11.27.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:35 +0100
Subject: [PATCH v9 1/5] mfd: axp20x: Constify axp313 and axp717 cells
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-1-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6WS2gG4eQGvXIRMEkRovIFW0AaWwhRZ2tj+ICuFq6Q8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVXV028an1ofFvHFk/HpnXt3P/fsXev2zlxZ7dUOs
 YDPi3be6ChlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEpDsYGbpu7Tj6oM/doVbn
 wJWN++XbV5faN6q1Tf69ot74o8uVjl2MDEsLpQ6s/sLV+Ul2e+2vLXk1B77N2KWs9aElb5o7a+2
 ++xwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consistent
with the other supported chips

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e0..4d770e718716 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.53.0

