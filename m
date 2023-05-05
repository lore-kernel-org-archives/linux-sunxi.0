Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AC1C12D
	for <linux-sunxi@lists.linux.dev>; Fri,  5 May 2023 21:25:16 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9660af2499dso27176666b.0
        for <linux-sunxi@lists.linux.dev>; Fri, 05 May 2023 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683321914; x=1685913914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PVt2/GzWyz5Ess7y+OCZ33ZvS4WPkfBPz+s8yoY7/9o=;
        b=cBhPsq7jc79GPzYqA9o+PUh5onUk8i5uaj49kXEhrw/1lEyz5LxLW/7/fVWlojfhKK
         F/8GRStnKtjRe8D3XJpOieqLlOBSAwYFMxUU2YiPGwfDQNplUTfZ6jz7LmZrfojhrFMY
         Hhgj9ov39uVCjETc9guBXenKjp3+W0YC7xT/a2TTlJUk1v3MOK5XvT/UChQYX39DE3il
         eWK0qiavlThnGZPE/Au01gwhHp1NVu1FD8vgzIc4J5lZGDsJTMlLe6zvM1IxGyT4fSS9
         Hr7e/LSBMx5Ek302/V8iR0+9eJk3iL7W9Sit+dXKZQl+iXl+CLuhGZrMbWYbr1rJGWBL
         N+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683321914; x=1685913914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVt2/GzWyz5Ess7y+OCZ33ZvS4WPkfBPz+s8yoY7/9o=;
        b=Nt/AuTkGLNlcJRlmZw488N6lJ2+5ORny2cmEvVINTOEMIXM9Ce5jGS1CJi2rWWKu0f
         PUEIR0wLzzknrBPZj7Foeuv5e4LeqT4saT2l9s9VtiEzoSl1AEmE4PKC7vWVLgmoLdEk
         crc3IaxM4IPrfhbOGJlABCyscni9d6iHonUrKy+XU3e4o9v2F0p/5HGa0eLRtmkomvk8
         XiXqOWmk3JLfQ+bcftgs+ExLu8zS0rT+lJmRK3IYLjjwGKmeq+GURmoahrSt1WyX5yt4
         bEXSMJ4cmmE+m4LbJmBIHLwVvtVNxxAOSMdkEZlI0p9Ay65kRUENQ/u41RfXjiB7voM1
         ScRA==
X-Gm-Message-State: AC+VfDzECaJP979EvPnMhAXTf/syPmHdKdUAvk2y1htajKsfVhlzEZfh
	Ck9TvFd3yssMB6z6HF8uOu8gEeVd3zY9GUF6+bM=
X-Google-Smtp-Source: ACHHUZ4uG8c0N6L9crKfvVhzWNWIj4OGzXKzRUKG1CM3TRYjrUABbTN/yhe0vAftEiN/MCLVhaCovH677AnMW9adMYk=
X-Received: by 2002:a17:907:d86:b0:953:42c0:86e7 with SMTP id
 go6-20020a1709070d8600b0095342c086e7mr2517436ejc.4.1683321914389; Fri, 05 May
 2023 14:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230505074701.1030980-1-bigunclemax@gmail.com>
 <20230505105805.548d1a1b@donnerap.cambridge.arm.com> <CALHCpMi8=t1bMceTOfZjh7aKEQcEEpfeG4wi9pB=5o34Ca+N3w@mail.gmail.com>
 <20230505170015.664c18bc@donnerap.cambridge.arm.com>
In-Reply-To: <20230505170015.664c18bc@donnerap.cambridge.arm.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 6 May 2023 01:25:02 +0400
Message-ID: <CALHCpMiwqkMRV2Nv0sKG8ZD2D6jbjVaB6_jcShf6hMBUP3D3Dg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add SPI0 controller node
To: Andre Przywara <andre.przywara@arm.com>
Cc: robh+dt@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	icenowy@outlook.com
Content-Type: text/plain; charset="UTF-8"

> Can you please try these patches, and use:
> compatible = "allwinner,sun20i-d1-spi", "allwinner,sun50i-r329-spi";
> for the compatible string?

I tested my patch (with compatible prop changed to
allwinner,sun50i-r329-spi) on top of these patches and it works fine
for me.

> If possible, you could revive this series, and add the D1/T113s support on
> top: just add the compatible string combo to the binding document.

Just one question. Should I do it now, or is it better to wait while
Icenowy Zheng finishes work on the next revision of this series?
