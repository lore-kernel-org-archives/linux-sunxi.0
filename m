Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2D52C82
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Nov 2021 02:25:45 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso28180667ots.6
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 18:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ElFmPv7JbuuvLjUrqcnZO/2cEbx3P5Wj/MSTTRUbYY=;
        b=fUev9+7qvxRm1/dvaXhfn5CabyEj1u3eCjDnopvAf36Ek6RosfnNrYtLtUPfWEK5VG
         GcjS5ChPibqTcJRRe84E9PIdujrFvk9iq0785DmdUmKLUle7Z2V1DjkJ3EaC3vcTtqaR
         8lN7JccIbV1wcsYe2hO4Sm23NL5XiUWorKKvsNiu64aJbxuyjl1HAsICx2r8n0lBHQ1C
         r4rHgunghzPXc8zYOFkCz0ptpAKzmIIdtsJM/amJ+tl8UUfMK3Oc0/IXIC0Z8JPugYej
         vE3GUTTZ9YWODJdgi91a1l9823+oIsGT6oNw2KxQXryA4SPQom+5ejX4EyZMEwB1W6pO
         oL6w==
X-Gm-Message-State: AOAM530WMiW3rKUthJxwNDTCFdKTO4Wg7l69oqwxkEIY5Ym2D+gQymYw
	kel6GIc/gt4wbVcKPnhvDA==
X-Google-Smtp-Source: ABdhPJyoJ1gzjMOXZ3xcw5zLSd2nLS0/d3pcsNJcQl7lCz14mLeHkInH7RKZOvr6grFRxjXam9DzUA==
X-Received: by 2002:a9d:4f0b:: with SMTP id d11mr47950681otl.227.1638239144207;
        Mon, 29 Nov 2021 18:25:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 186sm3385109oig.28.2021.11.29.18.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 18:25:43 -0800 (PST)
Received: (nullmailer pid 1056381 invoked by uid 1000);
	Tue, 30 Nov 2021 02:25:42 -0000
Date: Mon, 29 Nov 2021 20:25:42 -0600
From: Rob Herring <robh@kernel.org>
To: Evgeny Boger <boger@wirenboard.com>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>, Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, Chen-Yu Tsai <wens@csie.org>, linux-can@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>, linux-arm-kernel@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: can: add support for Allwinner R40
 CAN controller
Message-ID: <YaWLpkkSse+BMHau@robh.at.kernel.org>
References: <20211122104616.537156-1-boger@wirenboard.com>
 <20211122104616.537156-2-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122104616.537156-2-boger@wirenboard.com>

On Mon, 22 Nov 2021 13:46:14 +0300, Evgeny Boger wrote:
> Allwinner R40 (also known as A40i, T3, V40) has a CAN controller. The
> controller is the same as in earlier A10 and A20 SoCs, but needs reset
> line to be deasserted before use.
> 
> This patch Introduces new compatible for R40 CAN controller with
> required resets property.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  .../net/can/allwinner,sun4i-a10-can.yaml      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
