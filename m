Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61497A
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 03:39:05 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id h5so12325085pgc.7
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Apr 2022 20:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vfSyP/DWZUBUQz8x7MGMvd9tqfyWW3U2ltzQHY64VAo=;
        b=PhEAS7QdJd8hmzgyi1QjL86rAvq8jAyiJ/1Rapt+CkGJCdz3DV6A0S5PSMnNyo/IlT
         VEFAng1vjIuM1BbQkg+/neEd8xVTRO3Dyt7PDf2gVXkBvRhKHMTtPO0FYbbgpembPmWp
         WffOO2KaSMYQYdf8B/Ybw92ngpzVu0cZrkowXC5ORcBv6DbQucm5udtHEMAwiMT5O/p4
         o9Ph9nBxBngyHRqt6coOWQNKqz7AfzJ1SUjLMQAQfo7kOSxuwwrU8Bpw627mH2xY0JLF
         CI+1vSdCxRC6fq0xlsA6/zeftC3zNHrzS/PZYzARJ8PZfkQiHNFA+NWX8psu2czzQDkD
         83yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vfSyP/DWZUBUQz8x7MGMvd9tqfyWW3U2ltzQHY64VAo=;
        b=oL9FR8zcf+q78bVnWOolqq415QinI+CDlxwKnyWE8Z2rMgWOgkaOxEBMzzQzQLqVVn
         6lUwMesHGpoGF2jLPHgmHprYoWOmylA7dfRP/K+UDRaFoN0Y/5zH7LuPyIkkxfqDd+GO
         CyS/GN9G3zK6G9B4CjIW4FKrQ8/HtjA89xBgbSFMQgGhvFaXT//ZeYO7pA0eTjgzrztq
         ubadSIf2UqEpi5WTMwBvcu2dsS3G4yOMS7fnCh8Sg7RmXZAFTerPYUo380jImaVpKpgq
         6Wp4sEc5CYViSTPwKVU6FRuWuNuMHuO1LWvC+Yn9UiiUO0CLOToPja4vj5QKK8xjaSuv
         +zcg==
X-Gm-Message-State: AOAM5307GsiBD10kOG3/lEk8iLbDIbcLUiuYysImhdYJscK922/NhSoN
	+QfKOO2G1zJwXb/7K2ITP0Q=
X-Google-Smtp-Source: ABdhPJzuqC7DYeTKdy1ppqG31rl4wgw95qlhLeIflCHPgBK/tqK2poFm+7gzSgShCx9E7+yorPtfNw==
X-Received: by 2002:aa7:9255:0:b0:505:a44b:275c with SMTP id 21-20020aa79255000000b00505a44b275cmr17046511pfp.40.1650857945202;
        Sun, 24 Apr 2022 20:39:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:282a:d50e:e0fc:c145])
        by smtp.gmail.com with ESMTPSA id d7-20020a62f807000000b0050d32c878f4sm3352589pfh.114.2022.04.24.20.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 20:39:04 -0700 (PDT)
Date: Sun, 24 Apr 2022 20:39:01 -0700
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
Subject: Re: [PATCH v2 1/3] dt-bindings: input: sun4i-lradc-keys: Add R329
 and D1 compatibles
Message-ID: <YmYX1c6iPNb8NtTe@google.com>
References: <20220414002349.24332-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414002349.24332-1-samuel@sholland.org>

On Wed, Apr 13, 2022 at 07:23:46PM -0500, Samuel Holland wrote:
> The R329 and D1 SoCs each contain an LRADC with a programming interface
> compatible to earlier LRADCs. However, the LRADC now has its own clock
> gate and reset line, instead of being always active.
> 
> To support this, add clock/reset properties to the binding, and require
> them for the variant in the new SoCs.
> 
> Acked-by: Maxime Ripard <maxime@cerno.tech>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thank you.

-- 
Dmitry
