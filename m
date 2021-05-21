Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0163470
	for <linux-sunxi@lists.linux.dev>; Fri, 21 May 2021 01:40:03 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so16630826otp.11
        for <linux-sunxi@lists.linux.dev>; Thu, 20 May 2021 18:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KrS2ImoxDpLOQ8y1v+DGJnRWn9kr/DL7TH/0NzkYf1Y=;
        b=UriUduM/6l/FfH2s7d9vb7+TlO6RJMDp7xe7GJ6kolMngStFb5I5uSE+eLAUq9G7zI
         X5B9WwJzzn4jYrd8xUH62bvZQykHSl8AuopbSx5uYKHkIEHATQIYus54+jt3gsU+zb59
         mS44XaQZ5AgapuxnYh/VHdXFvkQ+FtzkS/Y/T8YQUZHZFZb505hdhwquOqsZqmGSH+Ww
         JkAJClafmU/m5QQ3aNlGCD4SwuPlkekfjPTQl7ouqIHNiYvNruMMLCaTpj9i4717PhJT
         CxVdXSw4teqRhXT6/OsiuGTNU588TVD7S7yw7FvgXUdv1Q5uarZTywxrL5MNs9MNbrE9
         pKEg==
X-Gm-Message-State: AOAM530LFFDEBVQ8yiqUwUmbFsbQAz8iLa3rxke+KZp/YerMl8q9a4bh
	Gaf08dCNK3AFsds2m/nscg==
X-Google-Smtp-Source: ABdhPJwCzBEmJz6ZaXDHHd0Fn7AUQ1EMmLZj85T2DCBDFNRlzZ658/eVTfiZ2OBYENpSkiw25M8MWA==
X-Received: by 2002:a05:6830:40a4:: with SMTP id x36mr5950611ott.342.1621561203225;
        Thu, 20 May 2021 18:40:03 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d67sm873550oia.56.2021.05.20.18.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 18:40:02 -0700 (PDT)
Received: (nullmailer pid 2461072 invoked by uid 1000);
	Fri, 21 May 2021 01:40:01 -0000
Date: Thu, 20 May 2021 20:40:01 -0500
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megous@megous.com>, Jakub Kicinski <kuba@kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 06/17] dt-bindings: net: sun8i-emac: Add H616
 compatible string
Message-ID: <20210521014001.GA2461016@robh.at.kernel.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-7-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519104152.21119-7-andre.przywara@arm.com>

On Wed, 19 May 2021 11:41:41 +0100, Andre Przywara wrote:
> Add the obvious compatible name to the existing EMAC binding, and pair
> it with the existing A64 fallback compatible string, as the devices are
> compatible.
> 
> On the way use enums to group the compatible devices together.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
