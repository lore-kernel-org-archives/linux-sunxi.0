Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503979F8
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jan 2023 17:31:50 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id tz12so46498094ejc.9
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jan 2023 09:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b1YvEduE2Lq3FWBo//yhH8lPQLXXelkFLjhNzSZXfQ=;
        b=mB6aSPZ5KWd/zfVKuH9QriTeN1gEtyxHYvUGO/x717kwWaE8xssUuDzEVKkMerTsoE
         qZJCTTWBEjFbjajR0LRC5SShevWgKAv+WnGxyhckrF2T5u35aI96L10fClwUvDiZql8c
         YS/878SsI7UvUCv0wgNQpfN3FS0Ebtn4iTbwFzSxi8nToT1flZhatlaokNUWG/rQnBWK
         944QsUcNDPnwsj2bJuTDTZyj5cYXiRoDBAYZ5x/EZSI4/PX4dgxRsw79R5eN4WVLnU1A
         uQ0fhaWEZaUU90OjXKJGnRzZDbYYwe7bm92NvMGq3GWnIkOaGgHRmeE6XPDdJuZ+zlhQ
         1/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1b1YvEduE2Lq3FWBo//yhH8lPQLXXelkFLjhNzSZXfQ=;
        b=Lk7rqWt50zghzq5zLD1PnXMShq37GvRc1TcErJE7DooqoYoxonFqI7+3q2qVIb2UFL
         rYFcYOOeF6c663Ziv+2q4Vt6PV6SFsC0gjS917OBegfCgVLEH32pej9bSZlZ52y2wiLi
         HsVKGco1nx5lfLZL00Nf+ASLHjMyGbnQORwRMF8/qQULRshUiv22G4fHp+jEfsltXsqt
         ctljEWF7Pqx85NmDZu5LF/kXp0weoOpEm3Zo2Lynkw/nHDqNvq2mUrE5TgK0kFeheDJH
         gUd0JwI9tfQ+oG0/9F0/0Vwcb7WkCp+A76k+7YTePJlhJhSEtlTCdLAGSHcSC480XPEJ
         +1uQ==
X-Gm-Message-State: AFqh2kpveHBGiz1QM42jdd+Y1H1mS+6xUD0HN8JelrSxY8vfa62wIKxp
	VvCYOyolMsNxhr5vGswEc7w=
X-Google-Smtp-Source: AMrXdXvwLgmc7OIQcgcrv7byi14F85iblvv8fCg8r1qQxR7duwQM3dvEECmjIvkHON6osy4LCZgjgg==
X-Received: by 2002:a17:906:b00c:b0:7c4:fa17:7202 with SMTP id v12-20020a170906b00c00b007c4fa177202mr64973810ejy.33.1673544709194;
        Thu, 12 Jan 2023 09:31:49 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906319200b007c1651aeeacsm7644404ejy.181.2023.01.12.09.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 09:31:48 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v5 4/4] soc: sunxi: sram: Only iterate over SRAM children
Date: Thu, 12 Jan 2023 18:31:47 +0100
Message-ID: <2674451.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20221208084127.17443-5-samuel@sholland.org>
References:
 <20221208084127.17443-1-samuel@sholland.org>
 <20221208084127.17443-5-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 08. december 2022 ob 09:41:27 CET je Samuel Holland napis=
al(a):
> Now that a regulators child is accepted by the controller binding, the
> debugfs show routine must be explicitly limited to mmio-sram children.
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Merged, thanks!

Best regards,
Jernej


