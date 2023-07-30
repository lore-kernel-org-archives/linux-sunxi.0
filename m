Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8A1FA4
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 22:44:57 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-313e742a787so2629114f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 15:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690757096; x=1691361896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNIyjOmTuuTtM6Hs4Wl0S7V+TDvtLBJA22YFIc67fGQ=;
        b=pCKYNAtVhJhyCXv+kff/oTo4RPnZ6YZC1x2dpZFmXtzmfkPbTZbV2cCf9fKV1swcB1
         zs/QZPkaPncsaEmgTc4ufOzNRioThzi9qzRz67JWL/Dt7M5mSlsP/AXZ+aYu5r19jnzf
         6h6LStIOX6lCgWdARvcHFl0hHGDty00HF0heNF7d99BfT4kgu3t2M6gGkp2+Sav0nxfz
         HMLADHgDo7qA5C6Nl0PDuuokrjNJBHpO83lQ6evH+0BaJBjlvaCIypt5brEkGLE4wokX
         S1slhHDsndt9lmIBQuTIhUcq83aGgnvKVeLb0nNK4+ZaL/q7Y0h9mR+eYQqOErupA3jG
         XBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690757096; x=1691361896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNIyjOmTuuTtM6Hs4Wl0S7V+TDvtLBJA22YFIc67fGQ=;
        b=AYdOdGP7gY2KS+wMtrEl45adois2FY8l7Ph4nTu+Fz8Vi58KQNvQea5TbBSDqYDQdv
         tcYzgM5uuLTaIr1iS5jZbWZKoST+jA3WNsyR4D6/uUr1kQAoPnMAxoubLoarkVNdCmjz
         Y5RuguuIUZvNqHpQbF8l8mXhpDiMWSBeAkrRj4KYy8S/7VfUeNIuY4QbKjnsr0+l6XAt
         6+pecPWq6c02FWP5XfpjnMjWxkfUYHZQzHAlGuDi9yP9D42bzPWhIbo7vUp8lz2Et11s
         W8gPBCGVUZaLPjGLhoUPh6r3BfXxV89bFwSm+pyRCnFeuttzOiyG+9mKbCF1NG0pEW2Q
         Ru5A==
X-Gm-Message-State: ABy/qLbevpqHegYkP3ymM/eGmD/NJ0vYIPn7W/c1PA/9Wr1dUYnOs24q
	puJOJwX2xY2jLb2gOtaELC8=
X-Google-Smtp-Source: APBJJlHw1jeS+xJWBIL/nyWLcB0ZhIIW/bfictAmlO5niGjSqN9npWkx4TmjjPzTsPctVXz4lFOW1A==
X-Received: by 2002:a5d:42c8:0:b0:317:597f:3aa6 with SMTP id t8-20020a5d42c8000000b00317597f3aa6mr8923586wrr.18.1690757095977;
        Sun, 30 Jul 2023 15:44:55 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id o3-20020adfe803000000b003143b7449ffsm7482062wrm.25.2023.07.30.15.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 15:44:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 01/13] clk: sunxi: sun9i-mmc: Use
 devm_platform_get_and_ioremap_resource()
Date: Mon, 31 Jul 2023 00:44:54 +0200
Message-ID: <1936419.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20230705065313.67043-1-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 05. julij 2023 ob 08:53:01 CEST je Yangtao Li napisal(a):
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied, thanks!

Best regards,
Jernej


