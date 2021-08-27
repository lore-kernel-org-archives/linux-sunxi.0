Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAD73FC6
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Aug 2021 13:12:48 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id e15so3897739plh.8
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Aug 2021 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=T15NdlZMMRoCEeuW2qnUiXkXVgH1zfdF1eWyTLHVIqE=;
        b=tFMWCTZkT1tRI3bnrHAICYSoUPfi5TOLS3q2pNtOGJKGiylU/AYtMU3hInHHsCRK/e
         QViF5Kc5FdZ5dUocpreR7txGnNlJFyWguGkNKYpbaLvsksVW5qi8MBf0ZOd6Wy+9Wg2e
         yOgwD3Kn+G6Gz5CSxqg9TG4h1iYWDYJmKf8lWRbqxcjhc+rqd58lDLoIVq+4/UYzpM1r
         inhlTH4KG7hdekepDLg17uINltdwjVyfRgo4RVslLs2sazP9SNQF9ByVGUFxCxPwdVVl
         PRYO/nrbpxq93OHyd308pe2nsQDsohdxGmjypOwSdppBsaoMZycSBt3eU/TrvUOFfjo9
         QRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=T15NdlZMMRoCEeuW2qnUiXkXVgH1zfdF1eWyTLHVIqE=;
        b=C7e+6ZJ7rkwR0TXTH2wM0DXhV9AXrRVdO97qmxrLed/vzo8s1l8C8uwFnZL14WcGAK
         iwoxagcAm6bqMONQmSjPk3Im8Bfk5hfvkTlpN/oiP1yarRfqMEiC04duXLLp5Knn9WTt
         JcLY4UqFw6HRVQgrVPJnQmU08hcbfAwdbys5XdD4HAvKTGjIZX5hwV1oTAvPP0Va39c9
         zxdJbQTges8sZQheIzkTotHcz6LR4zGTRKB7r/ZHPq+5p588Tw7tgiYhZI0mi3c4DGLc
         N8RygAIsO8OIAPr10krvYVhJu9Gh5dajSLBGa+klJOSusn2l9b3LZgtDlOq1i3M/xVp7
         pivQ==
X-Gm-Message-State: AOAM533n7a0FDTBc4x8GwPzEojqDp3AORo94gozZ34ONA1L4L3m5OpeB
	z4ZTfokV0hhfMG1ODsSpVluhliVmOzZJheLmhJs=
X-Google-Smtp-Source: ABdhPJy169Xz+X0HIcK/gMs98m/AgDtuHIfk6Lji713rXgIleIiXTrX7Vl3O9lB0DmCmpN2kZT/oGJ+gF4LukikiwXM=
X-Received: by 2002:a17:903:2349:b0:12d:ada3:192e with SMTP id
 c9-20020a170903234900b0012dada3192emr8556564plh.3.1630069968016; Fri, 27 Aug
 2021 06:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 27 Aug 2021 16:12:36 +0300
Message-ID: <CAGphcd=ZR-Gh0zq=y-L9mf9agLwJBiav34q6TqUV+Te_UWFBuA@mail.gmail.com>
Subject: DE2.0 YV12 playback issues after ea067aee45a8
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Jernej,

During local testing I faced an issue where YV12 buffers are displayed
all in blue.

Issue can be fixed by reverting:
ea067aee45a8 ("drm/sun4i: de2/de3: Remove redundant CSC matrices")

Could you have a look please?

Best regards,
Roman Stratiienko
