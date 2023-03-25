Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B897F
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Mar 2023 06:46:29 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id w9so16022403edc.3
        for <linux-sunxi@lists.linux.dev>; Fri, 24 Mar 2023 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679726787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t31lSdxlv+f3UnKTCzTXxPs8SFs291Ak4ggkxKHEWCQ=;
        b=e85LsIzLXSkT6C6qzyR6esfIlJwHGYIuolsxpNnw5tvV9y5tDCdl1Qg2BlDfObHagg
         yIRCfK7X5P7COJwH+93g72ZCQbk363DZT2jw6tdoCQqwk/tG9UEsTff/B8pFiwMImGOT
         +I/tYfVWlrrAUulcuCxRGew85XWWP5iznzIFwYAbAZuDQ5kzEA2iTWuMGYhuQrEqYacI
         4C3aNAHkl/tUjCLnjtZ+i/E8+rPlzMvpBYAjMv6dRGGb+UwS0b126I1HnHV292hu+4IT
         PK5RijKaOJ3p4ZIdyVeMzdFc47dsM0+7woqrGfxYZLzwzpLFzvHkeYIoM22o2dE1eycO
         ZWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679726787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t31lSdxlv+f3UnKTCzTXxPs8SFs291Ak4ggkxKHEWCQ=;
        b=AoJF8qxvOY0ID+oCOBWMU3BoX+N7VSy2u0auqSk4v/OzYhh0tu3jD/J2QtL++PfeSV
         bX5qkW8L+L3HrVA838YCSH3/lxTlCGPsHovMwzNHNQSZ7GuF45EnGZyYySQZ+CQhLb+Q
         Uuj3BpOR6bBoHFGnSDtJDExPYiyU5puL3cBezW+QYJEfhejv3DCA7CEWmXV4z4FtK9Nx
         acvFx7WdmZdsavlwOyGaIX/EtXDdQiAXEyuCu+yPxMg77ww6UzROxg+bBkcwNu5HtbsR
         3LIOVKO4b5jIBsp0Qu3Efgn6sexkCcmW/0XhbvBdsgHBquWawMZJ30G1XX9PMhKN/ydG
         PBmg==
X-Gm-Message-State: AAQBX9eEO6yMHZSongGw8aeugzMUT5IXGsHXeW2GU9b0tuKjIyhvLmXX
	4veLgXmHr/2ZGH9KHdCxz4g=
X-Google-Smtp-Source: AKy350Z4pgYd8lR+O+hzCHw4O91G7VyXRBc7036pm9ql4cKpkKK5ONOROkWXHrjQJTd2IP89fQMPGg==
X-Received: by 2002:a17:906:f190:b0:931:a321:7640 with SMTP id gs16-20020a170906f19000b00931a3217640mr6505658ejb.74.1679726787167;
        Fri, 24 Mar 2023 23:46:27 -0700 (PDT)
Received: from kista.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id i19-20020a170906251300b009312cc428e4sm11287169ejb.165.2023.03.24.23.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 23:46:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: srinivas.kandagatla@linaro.org, Yang Li <yang.lee@linux.alibaba.com>
Cc: wens@csie.org, samuel@sholland.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>
Subject:
 Re: [PATCH -next] nvmem: sunxi_sid: Use devm_platform_ioremap_resource()
Date: Sat, 25 Mar 2023 07:46:25 +0100
Message-ID: <2671819.mvXUDI8C0e@kista>
In-Reply-To: <20230324070449.8182-1-yang.lee@linux.alibaba.com>
References: <20230324070449.8182-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 24. marec 2023 ob 08:04:49 CET je Yang Li napisal(a):
> According to commit 7945f929f1a7 ("drivers: provide
> devm_platform_ioremap_resource()"), convert platform_get_resource(),
> devm_ioremap_resource() to a single call to use
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


