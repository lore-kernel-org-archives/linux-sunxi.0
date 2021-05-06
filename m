Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0333B70
	for <linux-sunxi@lists.linux.dev>; Thu,  6 May 2021 15:27:58 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id v24so5825999oiv.9
        for <linux-sunxi@lists.linux.dev>; Thu, 06 May 2021 08:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UdT6oYAl8C18McgDZRJwiqBr5EXOadWWjWo9IIpUpiI=;
        b=hyQA74RtFck5qLGMgcfE+PxAbdBbcRnLQ8K0QbxjjU8xIQOxh17gP1x0l4zkfZoU+G
         55vfhC8xEWiIy0mEdGqpjTv6YXGW7aMZ+FbAsx4/m1qGS7KS9kkH965TfbQF7B1FfjQj
         mmemNMs/UcgWK/kgIyPhhJyPIibV3MY/N2q+pq/EwWk/h8/jQOZZzxEgvDzZirXlNll2
         JATOdi8s2VzSnVV8IHKPkRXHoYvtA/UQ0q8kbs7JrIA3c6AfEkXjoSvBGjo9JX0pJeAn
         PwKsEwT2G6sziVoztpDKPS0Jwfrxl5QHSM7CUgctlWTsvLHfKi0Fav/wLinQdYCyE7oF
         Xe+A==
X-Gm-Message-State: AOAM530DIrTWn8T+KoLEtm3g5f9dvq9vpQlLKbuVisp+lKleaBi/Ir1i
	rDW+fI9DGY/Xp9DrnUed+g==
X-Google-Smtp-Source: ABdhPJyfSKCPn1AAWQTLL7rj2o6oQ4zHblgRyRmujHrElL8FaLsjOtDR8HoNVOvV0IzUVddMwqThRg==
X-Received: by 2002:aca:f5c7:: with SMTP id t190mr10889877oih.67.1620314878299;
        Thu, 06 May 2021 08:27:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r2sm631451otq.28.2021.05.06.08.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:27:57 -0700 (PDT)
Received: (nullmailer pid 357985 invoked by uid 1000);
	Thu, 06 May 2021 15:27:56 -0000
Date: Thu, 6 May 2021 10:27:56 -0500
From: Rob Herring <robh@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] dt-bindings: arm: Add NanoPi R1S H5
Message-ID: <20210506152756.GA357941@robh.at.kernel.org>
References: <20210503143202.21795-1-amadeus@jmu.edu.cn>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503143202.21795-1-amadeus@jmu.edu.cn>

On Mon, 03 May 2021 22:32:02 +0800, Chukun Pan wrote:
> Add the bindings for NanoPi R1S H5 board.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
