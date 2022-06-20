Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C919929CA
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 18:05:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z9so6236366wmf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 11:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hzVrUYmO17yrijTGC8PKHrWXMneEU7w31zdlDGiRk5U=;
        b=e+H8utqjn4E+QAoW6aHYo76iY7iMM3A/+8R2ULMYcgA/JbSfknVLqPSj1SuZ2+UusW
         jLJ3mVkYXD5NzvjAJFef0dtR/LDj5EXmIkWsqT7rRJnMzSVGHqowiaA76xnfGv8uS1lE
         oKjJz5WfPEJwACxzoUXUJe1imMN/kT7jjCk6xrqImrHrZuX8FPWpkCwM5W4UEMuXj3a6
         PaZ8cpKrB4SgxWRghKQtdbPUkLm4qAj+9hblezb9vH2CfwrnOGOD/K84Xv/AXqFgasFc
         xKJGEb/WA9JNwEuPnUskBXXP97oKsRiImyn15bVuTpr1x/Bi4jxdiRFaIg1yJFM2Luft
         6OCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hzVrUYmO17yrijTGC8PKHrWXMneEU7w31zdlDGiRk5U=;
        b=z8/RyAU0NOYcGsSYn5uhGHP3UCeNEIWiVdeVy93c5+b08GK8tEoLSS8lf+kcjdvH2d
         4V1kQJZn6GPdZI1sV/3WoJ9bgBCLT8Y0xDStkpGi7Kf/duPVo6N6Zasp9NKHr5NHn5lo
         sdf9KFwCfbogCk5PEvXqtTNSOVYT14dP339bCSVUSg/mTf+voBRh9J1mIcgGNDThNoTB
         8DKfCkJK3T760X6OVPMKrR1ZqG57dIMIOBYhuM1CmlUQLX7R7W2MLY8sg8KJ6RAeCIC0
         urqQlh35DMjeoBLPiM7GjZXzaGidqYJtaGK6BDvuelLz46xxhaJIuCkKcKAdIl/8hInJ
         mWzA==
X-Gm-Message-State: AJIora/EG8WyuaxoxPYLOjT6VEHeBIKsDkRqBKPuAVycN8OhnaorrqLS
	sqMp5hUpUTqT80ge+nl8uwI=
X-Google-Smtp-Source: AGRyM1veM01CXfNAOVpjK0AAbOBs01ym5WDwguf/bcQ7947+LgzPhWD4VRFxxaUBr0rWUkW1ru0cug==
X-Received: by 2002:a05:600c:5112:b0:397:53f5:e15b with SMTP id o18-20020a05600c511200b0039753f5e15bmr26292661wms.93.1655748314161;
        Mon, 20 Jun 2022 11:05:14 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id l39-20020a05600c1d2700b0039c95b31e66sm20753397wms.31.2022.06.20.11.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 11:05:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: clock: Add compatible for D1 DE2 clocks
Date: Mon, 20 Jun 2022 20:05:12 +0200
Message-ID: <1915294.usQuhbGJ8B@kista>
In-Reply-To: <20220411044002.37579-1-samuel@sholland.org>
References: <20220411044002.37579-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 11. april 2022 ob 06:40:01 CEST je Samuel Holland napisal(a):
> Allwinner D1 contains a display engine 2.0. Its clock controller
> matches the layout of the H5 DE2 clocks (2 mixers, no rotation engine,
> and separate resets), so use that compatible as a fallback.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thanks!

Best regards,
Jernej


