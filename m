Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F17E
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 17:59:41 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id y3so10780270ejo.12
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TtgZ9hhhM4u37jsTuLZNpiEojGjDtunmh77jaqRuyTQ=;
        b=Z4guqvZ1DmvBpFabB1XWYbAjbioMhUlKBS9dG6i3rc6ljtSqq1aV39L5YsbAbrMIqU
         dVigS191k+K5O711V4uWIdpI6CB/75y22CLZml6p4Hfv0TKF1Ga8tsaXt7fVglHSgtr7
         dM6gVArOUOlZk6VDrG9RL3cmF/AcVTflft/tnR4Mrr7uBPOGL8zBF+S9yIlWy04nR9hE
         2EymrYGUwA+2DYX3iegcO1njjYDVm7to9pnz5eq7jMaYxadCux9aKQnVi6PgTmjvLYvr
         I/9sEt39ou7PEEjajbQtGkEyDAppODxySeUDq5l2B5mflpUp62/5T78j2ha4CXy4wHiD
         GrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtgZ9hhhM4u37jsTuLZNpiEojGjDtunmh77jaqRuyTQ=;
        b=gQ2rlmDRLotuImI6ns5dR2gZanvle6eDtvC2Em4f3KRtBu/szJrAXM0tpgGA5pAXXl
         kvjZSuvPyNYmwrCzYV4Lly7arigLEjIx7AvqskuI8j4G40qtOjkQrtIydKw6gJdH+oKo
         pGmRG3GHVYWRxyna+dQZCvZvnpRWTo+epN2GQCBskAGT97iQWkJGzoqio50LZ125IoW4
         BgydJDzbDsQ3CWA5ba9bSM20l7CVZ0H6awK0Kj7zavTvVQPiDxQFBk7pa9LxrmXxmAo9
         PYvk0vax5dYepURHVcGMNAIdsTtrckP2Iq7RQXM5lmiuaOr22yktEqjm/hELApLi15rr
         P4mQ==
X-Gm-Message-State: AOAM5312qUVDVD/L5EVCo9w/Gm1IvxvsEzIhmRST75Inwj9I6YxmZWVU
	OQckm8khAImnoet3fk7/I5dBDmlkjJwWvQ==
X-Google-Smtp-Source: ABdhPJzYYWBWzPgmXZIuANGBFazqlekbk38HKp1EanXlXkro9F+u0aIvfoRGlTvJnkHEgdkYjebayw==
X-Received: by 2002:a17:907:3e1d:b0:6d7:1031:7e0 with SMTP id hp29-20020a1709073e1d00b006d7103107e0mr17169875ejc.580.1650909579477;
        Mon, 25 Apr 2022 10:59:39 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id u18-20020a17090626d200b006efdd9b95c8sm3867949ejc.47.2022.04.25.10.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 10:59:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Cc: wens@csie.org, maxime@cerno.tech
Subject: Re: Re: [PATCH] clk: sunxi: sun9i-mmc: check return value after calling platform_get_resource()
Date: Mon, 25 Apr 2022 19:59:37 +0200
Message-ID: <2976854.CbtlEUcBR6@kista>
In-Reply-To: <9ebabc53-72de-bbec-895c-fa3760ed5374@sholland.org>
References: <20220421134308.2885094-1-yangyingliang@huawei.com> <9ebabc53-72de-bbec-895c-fa3760ed5374@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 23. april 2022 ob 21:45:05 CEST je Samuel Holland napisal(a):
> On 4/21/22 8:43 AM, Yang Yingliang wrote:
> > It will cause null-ptr-deref if platform_get_resource() returns NULL,
> > we need check the return value.
> > 
> > Fixes: 7a6fca879f59 ("clk: sunxi: Add driver for A80 MMC config clocks/
resets")
> > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> 
> 

Applied to sunxi/clk-fixes-for-5.18, thanks!

Best regards,
Jernej


