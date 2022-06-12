Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F351397
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Jun 2022 20:46:50 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w27so4810332edl.7
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Jun 2022 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u9vE83gxpyTneK+LRJDQvXwXYVpKO1rEjKB2avFmWvo=;
        b=LX189vhcJf8uU37VD5uJlBNUQBi4p9Ybnyg8EZHoPDKHgwOdHOVT3oLFwxHP9RfuI2
         pPb6NYt4GZYRmYabk0FQyDRqZxKu8CVF6PJKukcX8V6IKqk2386Wv8bK7W6n+QpDZxju
         W2UGWibVGzB0ESKBNb7+3rtzaz/U3mR91Dp0y1XVq4WjvB8o9Q92OSJXQugqeitdxF4f
         o7PI1ZVkhgKS5FIY4sAE8eI2LQtTgxrbhemDuPvuSpKEXlhiCvbZXtht8diSlfPCyw7k
         Ai/XcaCJPwpeuZTR3CcQxwJB9SzB58oIzgvu8GIZwrt7FfgEWMRVDfC3VG8cTCTdJ2WC
         Ka7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9vE83gxpyTneK+LRJDQvXwXYVpKO1rEjKB2avFmWvo=;
        b=V4UMIIQDIXGz6dDS0KvBqllEi6fyt0i2XOFw2pZ0qV3hGS7J+LlOw+TrqCdLW0GRc1
         zdCEyVRKhq8vAO1GMwTC3twrXV7X8/pnegG33l5bAlncnVA9YkmemW/baU5w5k4FmQbL
         cZsjw6SAxpGz6W9Q2OrCUZWO//sRZlBHrv3DqI7RSt0SNawKiA1LU2kIS1w5D1aaEYSk
         3wfN+sXgjopbxR2a6glw/3XXDRqHQaGZYCrW/GvLhK7X5yRKhsntu4na7T80S9VFJ51o
         P2Hd/1iZbPXCbwLM5EZTj/hi/58YuGemhXHktQZPl/Tok02ojhi/DfSqvJbmAIm3fFwh
         rFAw==
X-Gm-Message-State: AOAM530LsluTImBM9Tti9KWhAyip88+ITb3dDajPfwCZxRUmlF0f1nr2
	cnxceuBEsA4aLnHLJePZqlQ=
X-Google-Smtp-Source: ABdhPJz2Oqg/ips414g+9+3tLBNFwYAQfZqjW/LD/v8Mo66Tjc8UpScE7eZstv4jG9D4XGB12cZLKw==
X-Received: by 2002:a50:ed12:0:b0:42d:d1d3:493c with SMTP id j18-20020a50ed12000000b0042dd1d3493cmr61108810eds.174.1655066808534;
        Sun, 12 Jun 2022 13:46:48 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id jx28-20020a170907761c00b0071160715917sm2855419ejc.223.2022.06.12.13.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 13:46:48 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Use constants for RTC clock indexes
Date: Sun, 12 Jun 2022 22:46:47 +0200
Message-ID: <4405631.LvFx2qVVIh@kista>
In-Reply-To: <20220607012438.18183-2-samuel@sholland.org>
References: <20220607012438.18183-1-samuel@sholland.org> <20220607012438.18183-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 07. junij 2022 ob 03:24:38 CEST je Samuel Holland napisal(a):
> The binding header provides descriptive names for the RTC clock indexes,
> since the indexes were arbitrarily chosen by the binding, not by the
> hardware. Let's use the names, so the meaning is clearer.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


