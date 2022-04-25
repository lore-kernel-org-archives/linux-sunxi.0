Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0436B7A
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 03:42:37 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id w16so7191503pfj.2
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 20:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XJLiJZg5HG+ikEwaPWe7uEs1eOW08mcHB25PbbYNgpE=;
        b=Ps0zz82ktE7Sh2Vjle8I9BjPsQFxR7boyq1mTpomJGYUyyqlPFScxz4ijYuZcK0vxn
         me8y3q/aPtVKPG3L9FXZy4juMxVkvTek9NieNYaRKA6RzKfG6SyBto/PUXiAo1cPnp90
         3p6Xcz1WCZ70rML3a56N7/ddbsKvEKrPHi5ta/5oftx0xj2bNUijny1LJ+LrYxqsVR/5
         wWadMMFbDoHmWjX3ckF3XnuS7r6ud0vkWHlsaziNrUzcatdw7nnxb2h+EEqsC+bqo/iO
         xMeEQ3FCNRuVTXjl8IuUSCO3WLM7WOiVFEQQ/5pzV0qVM78jUqASTVEBbdM9Zld8wEdI
         hNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XJLiJZg5HG+ikEwaPWe7uEs1eOW08mcHB25PbbYNgpE=;
        b=q4eBF3i3gUmC6luiQAPbuwmAjjykw+xMd3p0dxwFFARX3Uwu0WDTewT7HkwMwF2h01
         T19i0jUuPzOMK4obavvgg5YnGE3y7iyo90bizZUTZrD4eWsYD8XuAj/rBDrCgr9sgwha
         uxq1mSydH/VS6FwvLX0d7eVEqqZ35noYCYsQcYd9uglpT9CqmONerfhEfW6k3uAKUxDT
         BwsGCyZOquyHbyqv5TPZbCoqpfN7/SgeXuS5KM+JaLk8DOdIK4INA8yv8md7AQaQlLBu
         8RZ4e0UTBi+BU8nhDyxoWbhanZkNerPzyGdaWrgh9xOxOfTdqzFtJdpC5fru0fo85FOB
         A1cA==
X-Gm-Message-State: AOAM530i17sFpuqJGahiXct/isd7dTKNTRizXNIyxp+AkurPWceo2moI
	cQCublu6fsKEnxPoIYxXmh0=
X-Google-Smtp-Source: ABdhPJxkHTJzliONgUSJai4NnWk0TzAOhlUBTml/InhrGu34T+oNrz4tjBmW7Ox8B8RxuNsN0dP8GQ==
X-Received: by 2002:a63:290:0:b0:3aa:8b8b:1a3d with SMTP id 138-20020a630290000000b003aa8b8b1a3dmr13119908pgc.208.1650858157511;
        Sun, 24 Apr 2022 20:42:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:282a:d50e:e0fc:c145])
        by smtp.gmail.com with ESMTPSA id k15-20020a63ab4f000000b00381eef69bfbsm8025429pgp.3.2022.04.24.20.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 20:42:36 -0700 (PDT)
Date: Sun, 24 Apr 2022 20:42:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
	Rob Herring <robh@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] Input: sun4i-lradc-keys: Add support for R329 and
 D1
Message-ID: <YmYYqZLrymMzcLaH@google.com>
References: <20220414002349.24332-1-samuel@sholland.org>
 <20220414002349.24332-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414002349.24332-3-samuel@sholland.org>

On Wed, Apr 13, 2022 at 07:23:48PM -0500, Samuel Holland wrote:
> This LRADC variant uses the same 3/4*AVCC reference voltage as the A83T
> variant. The R329 and D1 LRADCs appear to be identical, so D1 support is
> accomplished through having the R329 LRADC as a fallback compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thank you.

-- 
Dmitry
