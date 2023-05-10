Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B716411
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 18:44:08 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9619095f479so1217288666b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 11:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683744246; x=1686336246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPS2VOYPj9tvhVnf11tmZgqUIiOL0oJR1EZsgcJxV5Y=;
        b=BrXkYLveWgEDMLIx+hk2YsTKuck1qBJH2+cVNfTxpVbGMw3PO3P9v2ilSoAs2esdyU
         R+C/jPQPrldO9hwRMTtrYIVggF+Jqn3303ZhYxN+zGIo8OuNGoY7+s8Cf4XHdPcMU+RA
         FaycWzcf+Y4cls7Z43lP3FRp2gN0yadZlXTq7uGzsDVCMX1ffGmSq83ewYF6TfZHMTTh
         yJ1GxVV//IT97eW5fvylBXOgnQDycwvpQG5jCUXW4wnB0Tyx5wVe1nWhj+qa56qUHJT+
         sE/0qaicg19IXMYEEqMvy0o1a5Z4x1dXCIxi6OkBqgYyRollUbHzJ/3JBTrQrNQUbqc/
         8H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683744246; x=1686336246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPS2VOYPj9tvhVnf11tmZgqUIiOL0oJR1EZsgcJxV5Y=;
        b=F1FpXrX/4JPOoapQR2vGPLSbVhu13YIcK2AsytjdV0TLs5MhAZrgmMx4LjedNKeKJ6
         qkQlDWKV56nFl6LnyyG5BLvP+0ZClWj5uUG4FTbfQ2kT/a3KTigpP1tHruCqTCe3m8BX
         pG5vtAOFidM8uwRvs5PAvkgBXDEqrW3AShJkUlfefXeambD9M2/q7Stc3ah9zvFLOBf4
         fzwRb7b/xR+7jxORXlJ87poqHkujhfA9B5r8OSW2uPf5Y8SX5+64AGVOQfW79weg/uz1
         nM4qbD51if8udWLGaZnfxeyvS3ZlAhZQA++F3fYAjs7c45knBhZ3ShsuQm4xzh/WC0IS
         sNVQ==
X-Gm-Message-State: AC+VfDwcrCsYDc7EABNKRLHIdz6gBPUj4lzbrZ5mRyjDC08fkOgLWQeY
	XvGfQuoU03vZhjNCUuQ1Be4=
X-Google-Smtp-Source: ACHHUZ4hCWeeIeHV2i78urTzM1T1DLqwN/c7QodoCeW4ajn/Fdkro9dtvrwr4zJg5A9dC5Mm+S7kRA==
X-Received: by 2002:a17:907:25c3:b0:961:b0:3dff with SMTP id ae3-20020a17090725c300b0096100b03dffmr15898231ejc.14.1683744246050;
        Wed, 10 May 2023 11:44:06 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id h21-20020aa7c615000000b0050bcaedc299sm2151054edq.33.2023.05.10.11.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 11:44:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Roman Beranek <me@crly.cz>
Cc: Frank Oltmanns <frank@oltmanns.dev>, Icenowy Zheng <icenowy@aosc.io>,
 Ondrej Jirman <megi@xff.cz>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ARM: dts: sunxi: rename tcon's clock output
Date: Wed, 10 May 2023 20:44:03 +0200
Message-ID: <4830298.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230505052110.67514-3-me@crly.cz>
References:
 <20230505052110.67514-1-me@crly.cz> <20230505052110.67514-3-me@crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 05. maj 2023 ob 07:21:08 CEST je Roman Beranek napisal(a):
> While the rate of TCON0's DCLK matches dotclock for parallel and LVDS
> outputs, this doesn't hold for DSI. According manuals from Allwinner,
> DCLK is an abbreviation of Data Clock, not dotclock, so go with that
> instead.
> 
> Signed-off-by: Roman Beranek <me@crly.cz>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


