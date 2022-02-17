Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1791463C
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Feb 2022 23:38:21 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id m185so5616158iof.10
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Feb 2022 15:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VPqLTBNPDYhEbgZt/YdvKKlTQpPFS9QLFLj/eqQJfu0=;
        b=v7zp0PubjjC2MRzUmsLSMmmW8TnG6rCe8Z0Za8zmyr9tsFGKSMgE9nCX7lYB+8Filz
         QVfj9P9Rt3zMY5U7RG1RycYZrFwzv6hvndWWEBngEqUR343s0+MRR6TFEG8FKU6PR51m
         zb+EAs9Ny+N7QFRVeAu27mP9EGotDP1hL5YBAhE8aMR9cZt+ySCsvjUY8UHkTfIsQFhY
         3uGj7RngxgvZLrVRoZ+z1Da1h0DNCFmeMaX1Mf5w+yqKHZdIle043d6nK9brxUBHkleU
         OCaswbbjJ6vQ1c+wpvEO0f4PQfEk6/5lykg7ChgaJbtas62yi2JCjV0rUPvh6rteOuX8
         xWVA==
X-Gm-Message-State: AOAM5333ecbGNohsHsVrWC2hsWqCWixm6gEd2spH8LOZvoGmtw8nqW42
	0udtSoVYC+0QDenUPvqdfA==
X-Google-Smtp-Source: ABdhPJxnkBwBCsnctqo57J95u71yi9llEbgOjpOUuIN18GpsnSf52LyI6k4cwm2+E3jtbV1xtG/w0g==
X-Received: by 2002:a02:c953:0:b0:314:3463:f725 with SMTP id u19-20020a02c953000000b003143463f725mr3395005jao.275.1645141101018;
        Thu, 17 Feb 2022 15:38:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h8sm2542911ile.22.2022.02.17.15.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 15:38:20 -0800 (PST)
Received: (nullmailer pid 3985592 invoked by uid 1000);
	Thu, 17 Feb 2022 23:38:17 -0000
Date: Thu, 17 Feb 2022 17:38:17 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Ondrej Jirman <megous@megous.com>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v10 11/18] dt-bindings: usb: Add H616 compatible string
Message-ID: <Yg7cadPGUwbiOk/K@robh.at.kernel.org>
References: <20220211122643.1343315-1-andre.przywara@arm.com>
 <20220211122643.1343315-12-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211122643.1343315-12-andre.przywara@arm.com>

On Fri, 11 Feb 2022 12:26:36 +0000, Andre Przywara wrote:
> The Allwinner H616 contains four fully OHCI/EHCI compatible USB host
> controllers, so just add their compatible strings to the list of
> generic OHCI/EHCI controllers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
