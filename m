Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B4712294
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:02:15 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v27so18887506eda.1
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy6KiD5Z4xgeaMyT8tMJOaVUJeGYXHoL1ukSN84rOPM=;
        b=qao2Q8Qo2SUSZpgpxgvgH/DSzVoXULvNzCAprBjS9yddJMBW3/IXl1of9YlE5kYX9G
         ty1CK0TIelc9Yv+VDNauJjIxgMXqqn0fgIJgeQzW42RjU7LaQkRfBZteW/gM6bZQ28Ml
         XYElFuQ6mKbI4C/aSdJ1HrCOIXNHK7jXbOH2FaL2wiTlk+ZNpe6KMaqK6jEDZ62mRmBU
         hRnaOTyqVFoWd7m6d8T8qfji3xti34+16IDSagWW8lMHMiqTcF0oM5ZmrsvoeKWwDEvC
         sptT7G9jcFAzoL8Bz2T2UceAspG7AUHn9dt4Z2hGp5LurjeKbGSz+Y68HBqnVzbPAHwf
         hLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy6KiD5Z4xgeaMyT8tMJOaVUJeGYXHoL1ukSN84rOPM=;
        b=pSfeOlPiBmvRtyo7SdjobJEk7/XJ6SAXrkCWusLJVpup/vKo4T2Qv7G0+7csMDphcm
         bzRtp2ANzeHE3m/ArivvT9ZmDrVsEolUc5oG4g5Lsm4Ad94QJ9LJcBsjSodJv3KLJORJ
         SP1XcfhOh6BejainyPBDYzkJgCoL2aD8qqx9/4bCG761GucS93ocoSSYFEF8EjSvD6s4
         IK5iIWmRdSwLPYOygT5YdYDpuO/gB2r1tFkvjvmiDn+DFWmbkz9rfBcYtuVnex9K65Kz
         Sij4kc2BD1Tu+79yHeMRAWjjiJg4TvFFT99pW9QTHk9q4C/unSxQbG3wm9tZtwIQ9Jls
         jNBQ==
X-Gm-Message-State: ACrzQf2qZW2MqylecWfDo5vx+mf0iPbNFZQAHiad9y0iuCVlY85YFGu0
	wc4jsOyqPpAMZSea5Fh2QKY=
X-Google-Smtp-Source: AMsMyM6QRO4niT0rxj3uplCk/Upmuf/tSQMUMLszIcG+aOaDT0PqNDevgvIfJCS1b0Pzovid6u9LeA==
X-Received: by 2002:a05:6402:22f1:b0:462:f6eb:6c6b with SMTP id dn17-20020a05640222f100b00462f6eb6c6bmr51625087edb.365.1667844133550;
        Mon, 07 Nov 2022 10:02:13 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906210a00b0078d21574986sm3604788ejt.203.2022.11.07.10.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:02:13 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 08/10] dt-bindings: vendor-prefixes: add Lctech name
Date: Mon, 07 Nov 2022 19:02:11 +0100
Message-ID: <3130446.5fSG56mABF@kista>
In-Reply-To: <20221107005433.11079-9-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221107005433.11079-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 01:54:31 CET je Andre Przywara 
napisal(a):
> Shenzen LC Technology [1] is a company making various boards and related
> products around IoT and AI technology.
> They used to use the "Cherry Pi" brand before.
> 
> Add it to the vendor prefixes list.
> 
> [1] http://www.chinalctech.com
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


