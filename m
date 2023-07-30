Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA961FA4
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 22:50:09 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so58965601fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jul 2023 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690757408; x=1691362208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsawj/okJxkOE6tbkBUKnS5IEaUD+sUamL8wpnfLVls=;
        b=InnBQXHHoDHKmxspkaC63IQQejVy/ScCIdtVKOGdn+5uD7xm2bfIITMu4mxiJD1tBI
         WsX1JN3Rb9yBDKjBlXSeBG1Kutt0wTiySHfPmXlWnDCSBeLBUtSR/ephO2wr5ncOxcrj
         vs1HHQ8juTzAIPCU3UXUm7m0oJdC9L484hTRovIShbYiR1/ShF1D7W9bjsDW7yLYAVbx
         cU4NuS4TWHGRoph5ZfcVmg7sDgrwzOn/Woa0MuwNjyyfYt4oGc60caWzYzx1dMOXzJK/
         NlkgvIKoh6rocA0C9yfopvJySTEb6ZKr7J/le5r23skwjP1kIC8C7SdaboegvbIrVDF0
         aFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690757408; x=1691362208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsawj/okJxkOE6tbkBUKnS5IEaUD+sUamL8wpnfLVls=;
        b=iUq5W76ZpLzoHH8XlU31qDaKsZvrU+ubMO8XrevZIRORHPvGGg9oq9aVtGyNQC5Ym5
         450fnYNczgxVl9cZeSFjrtmjiWT6992c4zQHl1qXUu0U8ShoKZVEqsdOgxSgvn937tqQ
         HSGMhF6XUnR8D7moqaHtqI8Kiqm0ZGF2cmeTD1QYeNIgLPSfWd00yo/HgUOKl1iymz++
         hzKsti9vU4NYZJokoFrQoB/BpQZCnUsGI5hhLlTYSoSNDjbF0mH5LGfqNDXLTZYCks+T
         SOSU+DYO7ER98aZPJdM2vSEx6aioLIT9VQ4OtGhVDtdU1K7BzG0H0dpo1XcUHKxKGaRF
         BJKA==
X-Gm-Message-State: ABy/qLZ4kXTo0o07paUXZdTCS2K3Q9MLJatuRcCldREwFJOFqJpJlwgR
	Fz3c4YuzgBjHqDpCW2tqutM=
X-Google-Smtp-Source: APBJJlGnA+fBqb2blleyCSfYQBRRNVcNfvhhhx+6iP3+UITDNLffibjwEOcoQPuf38NuAdv3DO9PZQ==
X-Received: by 2002:a2e:7013:0:b0:2b9:5b46:2107 with SMTP id l19-20020a2e7013000000b002b95b462107mr5586086ljc.9.1690757407847;
        Sun, 30 Jul 2023 15:50:07 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id q10-20020a7bce8a000000b003fe1cac37d8sm3031955wmj.11.2023.07.30.15.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 15:50:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/7] bus: sunxi-rsb: Convert to devm_platform_ioremap_resource()
Date: Mon, 31 Jul 2023 00:50:06 +0200
Message-ID: <3509710.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20230706072042.31296-1-frank.li@vivo.com>
References: <20230706072042.31296-1-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 06. julij 2023 ob 09:20:36 CEST je Yangtao Li napisal(a):
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied, thanks!

Best regards,
Jernej


