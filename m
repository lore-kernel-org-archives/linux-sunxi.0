Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432D3C109A
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544219; cv=pass; b=sjglwA9UTtUmbS22yTEAovtEXvuwdSE9rGoQk0PBxljxDn/QPDO7d6kUuw9veRynt8HmDPHmBdacGnA5V8B8DmegzZEfrZ6PyjLk74w2/i8Zjq371mJtHIxf+4ZvshQPjzvIpMcx1Kwp+/R2Taulr18F/MKGGpr2ZDlDaFHeN7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544219; c=relaxed/simple;
	bh=cJJs34fb2h99W/KbF5DWHeZGBBI0ty2ys0AP2AMX3NA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMqHtZqbomdt5NBCXx/SVoz+IPlVqItqT5kt7fphltlqM9o+YRNRIsxKOzo+7MYHCO/VKmO5uJ5Ylxgu3uCmi9sJv+WBp8ewh5K2WPj5Tx/F3N19syBbXzSkjkWmvhhRfaH17V+PRVyejRaujFkzRM/J0yoIf02cR5xXwJS0e5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy3jNnhh; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy3jNnhh"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a4c5c582eso183604137.3
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Sep 2026 00:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544205; cv=none;
        d=google.com; s=arc-20260327;
        b=U/ce/96k8UiF6Y6fD5VRq/Kd0uwrZGBWl/RGtZxeOIXdixnkdONfxjXhF/o6HV38ge
         VQw6lNwuuHczj3eQ91LKnKG7WoL+slnkzQeqvF4XXmb65Z8TiYeOYJJW0xoXwpklwS7t
         TtJhby0DcK27e2AHmZL+AnELRNgc/8MuwNAl5/BjKOv3cEaseFQGG9EkFZRoN505AwK+
         SESwAIKoNvTDMZA+gUCoibucxlSI0JP5BjYMODRTlBq/RN7GQ69vo2nq3YlDZEsF7+CM
         fPTO5weuCkezE3ipi3dRY8aN40USNB3iWgzCiqnM+K2b4VLHzHCf+RrXQLRa+HQOSkiR
         SfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        fh=PsDI9wnAgAZZxSVJ+zbwJbViy8OEK3hTfKkNVhy2yeM=;
        b=cyXXysSv+NfJ0IHZbOh6TfrZEab1XJUWtNO0ikhvLEzhwH5JHivOUYkmManPTnJHBb
         sUVKmT3wg+G3qdGqLfRfHRnCGA+kdxZnWV8RGF9PBCjCcTrJ954XNOB0pfJs7FK0HCnu
         +CwBEzmSiQ9N6mADoJLIG+mna32zk4WBIisMgzZ4mEqU9e/5iA1NjlB0LFjQnxPZJr9n
         C8TSorRpU/aMojbt4ci4UBj9XZnVsTlHBDpUn5mZWOPt4ET8kllEWzrH4OermxWNNXF1
         8QOjIYanKBt9Rv/TMaEsINcRqN07FckTWlJqPpTjuz8B0Ng8tT59MlYU5PvfANo3uQNs
         kMeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789544205; x=1790149005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=Dy3jNnhhParVmhnS+u446NHmhQ9RL9R1HATGDC5sUNPtHnNuuw8UxTB3bAm3IuAmAI
         6ryAA/IpCn7rDzhjigT/xJr8kA1R+G24j6tAXfOQpT6W2eu7yNSAjUniR2JYCDmdgoHn
         cTxEAYajyVRoY7xaqY+6Qt6UZngF+6pJfBQdYv3hTSR8pD3jWC53xCSgigBJCgKAmlWl
         aJIKP0Ki/ATzbAaJMKs7GR/yV3h4LAs/WZn0yNscgR0lpzEJE9+dgLLX0OhHsmNW1/Dc
         jrEjhehmlzFI7AAtxXGqadAC6qPom2A7YheymzR4GucKopu3rdcbJlWKpx/xqtvcJCF8
         +BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544205; x=1790149005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFdl8Va7Swxkjw5uQRSJKt+eRYekF3RPnToHL1YscsE=;
        b=U1lM3kY4jNLWZPNgBM4iMbwbidPa+nQFOMr/vuAnYkgDgYc3BikLhCNBTOUWcko9Yf
         aiBR8tdsAeJViI1FKVm3tAUYIMsDp4NiB5hIakYLejmTONiEYm7Ddwv8ur7qFDQ33URu
         dlPNPUbSkxQKn4o4MWE2JsG5/8hTzdmHNIHMWJ3UyARVs3kNK/i8IUZvP7skjKr0Hu1k
         KVyB+oLpo26UzbbPN0t2FrChqeU5EU4KRx/b5njsWn7ZSnFPz0Q75u1xfK88SaVbm9Hb
         wdVizYsGR5UnQV/nRt5wkgBYSRwvRtM36l3EHddMZ6AvQd9VKRtMMmfglDLe4XeOkKGQ
         GjoA==
X-Forwarded-Encrypted: i=1; AKwUvBz7gHWNZWhLR5adAir/ZH5Cb7vS2eh+c3oAMCkAqqBw6ZG4Pw92IjGE/OBwdXdUVsulPKsf6PA0t/3wnQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kRXBwsqJHkLyyh/nWj3gH3KmuEBL/Rn/5L12aPnpA7YH967yHl
	QHjj8Rr3gVN0Ek/5l4la+uzd1VEOUiWXuVBbn2dFo+iaowcT52fnjuNKodPDUrOGwgjI7gyqNXA
	FOBzRyoAhfHiYo5hDEi0b2nACYs1CUEA=
X-Gm-Gg: AYBFou1sEFJkYAf208Q2+ChDqYW5d5sCAakxwOdgiJ2wI2kkKtX4yNl9YGSidnFOWZu
	ZIF4rNw3g/FJfoxP6epDVCERuKEoOXEotDIgX2BAw6wvHE4gnSBxxxI3/wiVUJaBufYa+xXlqG3
	YzpQBlXpG5jJSeHe9uIwUXdNc9JI+MKo2/LTU46t+cRxPTRp0eRuDLEHnf/D4Brs6SwKzdab7ES
	sI/DSidmUBEY8ltqefIb9veEIxo7GKc0vh4WPVe/gPhFUuqZTURFVsMLPQX4cJX+tIPq9i22utY
	CsE3mHDKIEK1APKJqCqyRqhlwg9MddaDjLzOAXYGWo9IYQuT2ZUCAV9+WjgVwzI/elY/RaHPrLP
	T7opKPQjTLcJ7hSSn6fUcTisN3gUm1+3+vpp7ivK++SI8Qs5HJ67rsmb3uwHvxMiKDChwhWMihi
	lRp2xy9hLt3hI/OK0gTeKdA7DS3Y78g9VfdlVqXomwtr+LVRnaILRMmxFC
X-Received: by 2002:a05:6102:4bc2:b0:79d:c493:f1d3 with SMTP id
 ada2fe7eead31-7a026c4142dmr757332137.7.1789544205003; Wed, 16 Sep 2026
 00:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915-submit-h616-emac1-v1-v2-0-322b32e40eb9@gmail.com>
 <20260915-submit-h616-emac1-v1-v2-1-322b32e40eb9@gmail.com> <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
In-Reply-To: <14e61e7a-29ad-4cc6-8993-dea7a8d7c846@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 16 Sep 2026 01:36:34 -0600
X-Gm-Features: AcwNN1WscQQGHuBz-gQadqFD8U_llvHSSS-ajPx5e079eC1kBH6r8x1MbCO5ieo
Message-ID: <CADvTj4qtuV_JEW5Byix86eQZJBsc_dmPR75ypVWn4xjem9rpAw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: allwinner: add H616 EMAC1
To: Andre Przywara <andre.przywara@arm.com>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi,
>
> On 9/16/26 05:07, James Hilliard wrote:
> > The H616 secondary EMAC uses a separate system-control clock register
> > and supports only RMII at 10/100 Mbps. Add its distinct compatible
> > without an older fallback, since using the primary EMAC clock register
> > would not work.
> >
> > Constrain the PHY interface mode to RMII, matching the hardware.
> >
> > Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>
> Where does this come from? If Richard is the author, then please reflect
> this in the patch (git commit --amend --author ...), so a From: line
> appears in the body of the email.
> If not, it's unclear why this line is here.

This was loosely based off of a patch he wrote I guess, although it has
diverged a good bit so maybe should just drop it, idk.

>
> The actual patch looks good to me:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml  | 13 ++++=
+++++++++
> >   Documentation/devicetree/bindings/net/snps,dwmac.yaml       |  2 ++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t=
-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-ema=
c.yaml
> > index 323a669fa982..2cae0133b3cd 100644
> > --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.y=
aml
> > @@ -21,6 +21,7 @@ select:
> >             - allwinner,sun8i-r40-gmac
> >             - allwinner,sun8i-v3s-emac
> >             - allwinner,sun50i-a64-emac
> > +          - allwinner,sun50i-h616-emac1
> >             - allwinner,sun55i-a523-gmac200
> >     required:
> >       - compatible
> > @@ -33,6 +34,7 @@ properties:
> >         - const: allwinner,sun8i-r40-gmac
> >         - const: allwinner,sun8i-v3s-emac
> >         - const: allwinner,sun50i-a64-emac
> > +      - const: allwinner,sun50i-h616-emac1
> >         - items:
> >             - enum:
> >                 - allwinner,sun20i-d1-emac
> > @@ -91,6 +93,17 @@ required:
> >
> >   allOf:
> >     - $ref: snps,dwmac.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-emac1
> > +
> > +    then:
> > +      properties:
> > +        phy-mode:
> > +          const: rmii
> > +
> >     - if:
> >         properties:
> >           compatible:
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Do=
cumentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 2ed4564ae99d..b20149c3e850 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -57,6 +57,7 @@ properties:
> >           - allwinner,sun8i-r40-gmac
> >           - allwinner,sun8i-v3s-emac
> >           - allwinner,sun50i-a64-emac
> > +        - allwinner,sun50i-h616-emac1
> >           - amlogic,meson6-dwmac
> >           - amlogic,meson8b-dwmac
> >           - amlogic,meson8m2-dwmac
> > @@ -623,6 +624,7 @@ allOf:
> >                   - allwinner,sun8i-r40-gmac
> >                   - allwinner,sun8i-v3s-emac
> >                   - allwinner,sun50i-a64-emac
> > +                - allwinner,sun50i-h616-emac1
> >                   - loongson,ls2k-dwmac
> >                   - loongson,ls7a-dwmac
> >                   - ingenic,jz4775-mac
> >
>
