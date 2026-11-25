Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624121;
	b=ZNMP7Io8o4mB5/u9SxpPTn+DG1DEQdtxqHS93EmZjDUHwkWlK+s5fQdP9KdameChFc3J
	 83mf/jp1yZ/5rL1D7e95+fTHlRWLyIyEHzpo92gevd3hB3UC1D90Vxxe20f5tiXD6moug
	 Lc54ZXVewh6PJz8lqlaMKtO6FsPoYbRx20wBIBI6VDnxJMaH1it9SLhYxOXXQhHVA8Egr
	 8XeAu/98QIjJKXJDE/+YzsQg91R1pVWY7oUbO/LMIS/WnN87aT4s7zm2kL6pNm72SW2Ie
	 Qn8G0h4w2hcYPJLQN5B42aMYcr3d3x/slk0PUwMXZAlEgVmEZe8gQg5lpZr0OHsEtZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
	b=2TTMq4Qsmk94p8R6Sz/NGbUo90jxl7WipgEjM+z+qyIVWX/iJJ4lx9m0CZjH7AO+K7ID
	 kElVOn5pvkQSP4t2BSI4L4PYZ2NAg4Pgs/qPk5190nwJeXxEOMX+0xFGtScmInVQzQQXM
	 uB9CnlAyZV+Di7dj8Bd/uuah6WLhnV7d6Tl4w4JoWYpJlmRwqD7wJixLGUtcLOa/DpgSg
	 MIlH+or2KX58xe8d7YszAJdvp1FwFlk89tyPjScXOmLOzMDs5x9tQPQ5EDqCvMm2zFVAO
	 o44PHd4BQmi1NU3pMZ5Faxwj9tFNgoaQC/tQkxYVb6UqpA6G608R95BpRc3M7BwVTnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P7k8xwmV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D8606A338
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 16:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20D8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P7k8xwmV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so53622105e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624119; x=1796228919; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=P7k8xwmV5vzq/1hDwwg4/DllkJqnBK8ekpTzxarjCGP4eWw3Khvv8pTHDHM0nFVwaJ
         lXsB7VYwK9VUUXpm3s41fs3Ny9KkN7/Es8bxz578DzoOvc8rgGDreqGoHiO2B4G1gAaU
         eZhls07zhPjSIr3MZuWkzAVbx8zkSxJL4wb9x0KGLDKoxYU6ZWA3pR5/r7GHeqvwmDlR
         S5ujjpe/ww9FEk7B2caJ3daj5kfnJPjM/tsoN1uTA44v3nK1srw5b2yX6aSzuIKTj5tt
         lSDnOXhl6vL96nR3XH2ACYnwI1zQS1l+kKnfFh6hLGKSKhUK1ssc4JW3X4zH3NjZn4iX
         5UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624119; x=1796228919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=pxHLTMlg+D7Q60ALiI8eLd3gcJxfR/OHqDz+au2UolsZfAe81Fcpg8dD5hyWsm83ep
         ItPeq/NGDX907ZqRl3M1zV1bFGHGxonBTeWeZFKMHBbqtc56bz7YBYKO3Jzj4YYED8Cd
         3PmgCMe0MDTi89fBaCqFCzkxIAZ81JlWUwiyWvC+N8uqXkjklh/WQQtchjK0EDjFhHid
         nnYiUbIeZBp3p4I0VSX9+w5605abZhq7LXPElpQdpIOBB5fuQQ4Ac6n9HeSCUoB0wPts
         1vkUVHPqqUSU0oVHZTa41r8jebqHPyzsR/ND4oT4WKtXDF0q/rGvuA/R1NdXZL4nfbFL
         VfHA==
X-Forwarded-Encrypted: i=1; AL+hErH1VaMLgzk3AqqlyDRgynnBRaAdyrpZKh8hZS2jQAxCSdMNaJjywjta3uVujeLYvcQjXixjmYeF+mfiMg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Cg5vack4tv4FAsfKs66FaCmYRfBuUoS3SJ2ay/bW5KNf8sv/y
	L6SPgKZLPLhVurUmoU+S68yvBm/Pr3RHIUmh2b0pThVUiaqvfcp/Wm9pbAC9vUlOuy4=
X-Gm-Gg: AZFdTZcAgIOn25prwDwifNPuC+m0LhaP3hFjfhAs2wNo55QFNcGdb1Xn6t2l0vZHBbf
	kbDIbaBsEmvlgaTBlu5iL9HntM8Vt6mXFfAYS82LDV3g0HFn3PyKKoyNE3HV7INklGs+ZpHfR9X
	6RrvTZdznU9jV1/tn7gSRoQJ2eDqXegQHjCdii2QbIzG22NxGxlMmZu0A0W6hzh5+KEv4HtloLy
	Eug9RtIDVTm9wU6lOKLFEpSa2HkrsZrT4ekFeqkYlxQoq5/cxRChJ6+EQ4nLhdeNwjllwS7QdTH
	4WItAGJKwLCVIyzQ5v1Vf/6fyAjLSBBfYKJNgb5ZibjAY7m/pVu7giMOCwpeiEWupvfjGUQz4d3
	E23MXZ8O6dME6BmcvLIFGUOjMUXAymwZSiWNktQe93vhw07eMiUIwVi/aG8FBIr4M5dwWxFDAtf
	TN1qYnolEtwDEogsW1XRr62bV8Kw+OEmCkeDJnF/QShjCzxbwcMlBDsW4wbcJlN6OmJNLkLiWXU
	P3RhKWKRBct9MN8ILQ89eRYBCTStANunsNdAf6mj2eMml3Ny1shlspxDlj+WXa3dHpIZgko9VAo
	dFCO/7DLcy6eOdGxfyYbNMxkAUvuajmSz/xhSKI45zSoUQ==
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr384806975e9.20.1795624119085;
        Wed, 25 Nov 2026 08:28:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:27 +0000
Subject: [PATCH 01/10] mtd: maps: pismo: Use named initializers for
 i2c_device_id
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
Message-Id: <20261125-acpi-mtd-v1-1-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=851;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=IHAi0qeArnt0Dz3MPX/pMNLkcr4ipLn3XGqru6V8PMg=;
 b=FYYb5NZv5bMag5GUq5jhUZI3EA/wssPu4IODYyOGaefHzIx0GqzM1xxUbS1yXt9hVm+9RShR6
 U7w6XKaTkOyAdXUAkIbyQhY8qzilz1ISb3JVyfa0dct/S0WrrapbtfS
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the i2c_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/pismo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index b0310fddcaa3..babb6d367623 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -250,8 +250,8 @@ static int pismo_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pismo_id[] = {
-	{ "pismo" },
-	{ },
+	{ .name = "pismo" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pismo_id);
 

-- 
2.53.0

