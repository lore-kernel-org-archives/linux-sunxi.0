Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7F286AA
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ce344fa7e4so3786803a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Oct 2023 07:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698242722; x=1698847522;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2t9oxYN3rsKk69GT+sMAlcc8j8BCgsk4o9AAcXE61O8=;
        b=ZoawvvbA9yvLQVvLTzpVuKz7JP56YWKlhOad8b5MEFRfOKy8yjuUKATTaPgNQtrXeY
         H/2V9qxZKG75x00w+Y6DorT5XMKQ5FHrMBAPLBAVpVbuk9cJy9Ds3/bJaxCPjkQz0Vzo
         SuJmvi9kRCw0bUT+h/WvDGL3nqqc4bwdYcqzd/ktNJPx9XOGI6NrbWtvXLI59miFfyF6
         /vRgnkPegQbz3xKudjPJt/nIRuCA1EyAz0ATCFeoRc222sU6aubg/SDJQoxbp66zBV+u
         6drPAIf4fPswcSkGJeWb3hdbE+g08aOEAeNWNEcs3mQjtvs5hg/mccDHwjAN0VALTfJR
         i4RA==
X-Gm-Message-State: AOJu0Yx87/Taq41oZS3pIIO5ehX1qGos0LRoRUMqFGiVYoozQ0uDWKu/
	hAsJfv2MWmUsqd/KCRk4Aw==
X-Google-Smtp-Source: AGHT+IHZwbA7/T2Cie9xzSfVJjTlYJrns7ET5Ntkdpdj0CP3GCyvFAiFVZ/zk9i/aLQ4mMVrs1++Eg==
X-Received: by 2002:a05:6830:11:b0:6c4:897a:31c4 with SMTP id c17-20020a056830001100b006c4897a31c4mr15222170otp.29.1698242721907;
        Wed, 25 Oct 2023 07:05:21 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y22-20020a4ade16000000b0057b38a94f38sm2366961oot.12.2023.10.25.07.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:05:21 -0700 (PDT)
Received: (nullmailer pid 4149460 invoked by uid 1000);
	Wed, 25 Oct 2023 14:05:20 -0000
Date: Wed, 25 Oct 2023 09:05:20 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 6.7 fix 1/2] dt-bindings: nvmem: SID: allow NVMEM cells
 based on old syntax
Message-ID: <20231025140520.GA4143384-robh@kernel.org>
References: <20231024171253.19976-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231024171253.19976-1-zajec5@gmail.com>

On Tue, Oct 24, 2023 at 07:12:52PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This binding supported NVMEM cells as subnodes and that syntax is used
> by few in-kenel DTS files. Modify binding to allow it.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: c5330723d5a0 ("dt-bindings: nvmem: move deprecated cells binding to its own file")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> This fixes issue introduced by v6.7 queued char-misc commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-next&id=c5330723d5a0c77299a38a46e5611a584e887b87
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>

