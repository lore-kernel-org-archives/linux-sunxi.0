Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57F7A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Mar 2022 17:22:24 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id c20so20902206edr.8
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Mar 2022 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaBMEcrePt+w27MCrGFS0ZRIBB+TLDUM++NKsoUse28=;
        b=F/GbgPgJJas+sWwxDfEdIEAV9MWpQmQZ6gGHvDgtsLI4ueojnctMqU+Ro0y6CE2jQ7
         7HfL0iW/kaYCw+0kfIOftIbVIwr6QG6MYwB9MVnen+D5b9abOs9torl8wGRAu7pdQm/i
         +FsSIKv3ftoqqo98xW4SbXxB3S9BeXWDR57rNoVIjO2wEh/n6XaeI5g7mVip+Z524Cyi
         KrhWaUk0jLHNnh1HFg16Z87GrqIRn95tDPK0/8M6r/fC5vRSO8jGGlWGxeU4oTOxuv1I
         I6yIkpSjzQalprgeeLcAnrb06WXcdkH68KPhC48XBm+zYHKs2a2WbqNEVl2b/II74CWe
         r6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaBMEcrePt+w27MCrGFS0ZRIBB+TLDUM++NKsoUse28=;
        b=swHuhTq/gPJIo9hVL//NxY5iybQsCowaqFL5sEAaGkzVcnN/Erz2f1C+7Q8z+WVIr7
         DCCCZEphBWik65ZYU/dlyTtlvvhelg+BtvWO7txOb4RyYWl99LloouglfxdbBxmqav4D
         vwTKK8sis0Its7lKbZa/crYj7/cjUE26hNXutljlQI32IIlYbaCHikTnS+brIrlxKfmz
         c1e1dtQOtHjGUA6QPq5k3IHU0+qsY8eLkTYgHhnQYcrf2WCvFF0ObmMK+OBki6h5oGoP
         azVP84AKUJoT8BWerqyf9ZdljvIeA4U2KOzYFWg5e324xh+zLBeZAzwxXOfCZF4a6Nej
         Ch7g==
X-Gm-Message-State: AOAM533+qX3/F60WZO9/fmLD3hfFldBjDlKBo9kjWeurZDgxXU0DN8qU
	OpgmJ6ITv8a3RLzVvhSsdII=
X-Google-Smtp-Source: ABdhPJyE14lC5sdDZko7CQASEf8TpHDb+WCoI++ZZovUsci3NcAk1M2ARl/8wru+mO0QLzE8MgfoCQ==
X-Received: by 2002:aa7:dd17:0:b0:416:320:5e56 with SMTP id i23-20020aa7dd17000000b0041603205e56mr21902178edv.240.1647278542246;
        Mon, 14 Mar 2022 10:22:22 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id q15-20020a1709060e4f00b006cdf4535cf2sm7037886eji.67.2022.03.14.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 10:22:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Cai Huoqing <caihuoqing@baidu.com>, Chen-Yu Tsai <wens@csie.org>, 
	Dinghao Liu <dinghao.liu@zju.edu.cn>, Dmitry Osipenko <digetx@gmail.com>, 
	Eugen Hristev <eugen.hristev@microchip.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Jacopo Mondi <jacopo@jmondi.org>, Jia-Ju Bai <baijiaju1990@gmail.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Ming Qian <ming.qian@nxp.com>, 
	Ondrej Jirman <megous@megous.com>, Robert Foss <robert.foss@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Yong Deng <yong.deng@magewell.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 47/67] media: platform: rename sunxi/ to allwinner/
Date: Mon, 14 Mar 2022 18:22:20 +0100
Message-ID: <2816975.e9J7NaK4W3@kista>
In-Reply-To: <85266b480902079391d4206b8aa276ff131a730f.1647274407.git.mchehab@kernel.org>
References: <cover.1647274406.git.mchehab@kernel.org> <85266b480902079391d4206b8aa276ff131a730f.1647274407.git.mchehab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 14. marec 2022 ob 17:34:42 CET je Mauro Carvalho Chehab 
napisal(a):
> As the end goal is to have platform drivers split by vendor,
> rename sunxi/ to allwinner/.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

I would rather not do that. Everything related to Allwinner is called sunxi, 
albeit there are a few outliers. This is similar to Amlogic/meson situation.

Best regards,
Jernej


