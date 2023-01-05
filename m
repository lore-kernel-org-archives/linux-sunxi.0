Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C146107A1
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Jan 2023 21:48:53 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so2371041wms.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Jan 2023 13:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=alrY4BFFROjvxIkAB5o41BnjtZA88VOgDUEcSd8IWn0=;
        b=a6esB51ehQlh+xCJznXrQI/Ax+apU6QhIYab6sEuKROtA+SrMN9Lnatm/7PgA8stYI
         I/5YdZWLIdsaA5OQlm3PqZofZVNh348X1cSilu9+3PztaBu7gNnonVJwWoGFZoTk0otq
         o7ELuEebXczh/6DK4q92P6PvTFEZTLhSImOeWFLk/SjeUW2XzxwJ+p2BQw0Z8rYcLuCM
         RLjSJFNbWgo4j8CXAyhHF+ekOWm89XM6bwSZFWEIR8Y9RfwGXIJ7Gp2DBViOwaXGVtiH
         xM3YTf+Ad0620EOobWDmnaNo4ixcTuKk+f9cZHQI2sZ+exRSIg9BOyImN03Mh1rg4aQs
         YluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alrY4BFFROjvxIkAB5o41BnjtZA88VOgDUEcSd8IWn0=;
        b=zGcPvpzdH/fs2sgYKrzf7wVPtuTmszXSp+36/9azGiEg0wRzZQMC9FgQC5edpd0pww
         pftMB1/aU1zNATY0cVFYCXOhDJfMxk/fU0cJKZPB5Qz79eLkC7kiNACI/ZCIJrS+6XrV
         zO+vC2DZ9bbjndxVMJMPTbfbu01eb8G7hFq72c3KuI5/0LsEIae4kRaEbea1CDx56urK
         ub57RfTggL7DMj6y1pSvTX7+GaQsa9RN55MOdflrPyWVHaY78JDgI9AOhOEPDS0rAty8
         Ya8VYavNTs5Au3+jUUqAySxdtye/yyi3n1bgt7d+CPOqbKmA05RJrskHX3bfbIXXihe6
         U+Lg==
X-Gm-Message-State: AFqh2krwJols7/gwpXQGITJ0TqoxwLCzwpOEcJLd6I6LDoxo09gSkTf2
	MSZxEOejHq+sEt49S/lrIuPOkzTvKANjsQ==
X-Google-Smtp-Source: AMrXdXtpu04KaShqbfrEZgE6MfFjk7gq830CPu9vTqUkCq2L+IXiiQ+AjDC30AdwvWqPt0Qh/WKoYg==
X-Received: by 2002:a05:600c:21d9:b0:3d0:8d48:2993 with SMTP id x25-20020a05600c21d900b003d08d482993mr37009723wmj.36.1672955331473;
        Thu, 05 Jan 2023 13:48:51 -0800 (PST)
Received: from 192-168-1-215.localnet ([90.242.26.120])
        by smtp.gmail.com with ESMTPSA id bg41-20020a05600c3ca900b003d1e34bcbb2sm4405739wmb.13.2023.01.05.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 13:48:50 -0800 (PST)
Sender: Adam Pigg <piggz1@gmail.com>
From: Adam Pigg <adam@piggz.co.uk>
To: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-sunxi@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v1 0/2] media: sun6i-csi: Fix format propagation in bridge
Date: Thu, 05 Jan 2023 21:48:46 +0000
Message-ID: <2864735.e9J7NaK4W3@192-168-1-215>
In-Reply-To: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3209878.aeNJFYEL58";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3209878.aeNJFYEL58
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Adam Pigg <adam@piggz.co.uk>
Date: Thu, 05 Jan 2023 21:48:46 +0000
Message-ID: <2864735.e9J7NaK4W3@192-168-1-215>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0

On Wednesday, 4 January 2023 16:22:13 GMT Laurent Pinchart wrote:
> Hello,
> 
> This small patch series fixes format propagation in the sun6i-csi-bridge
> subdev from sink pad to source pad. In order to do so, it uses the V4L2
> subdev active state provided by the V4L2 subdev core (patch 2/2), with a
> preparatory patch (1/2) that drops direct access to the bridge fields
> from the capture side.
> 
> I haven't tested the patches myself as I lack a hardware platform for
> this, but Adam (on CC) has successfully tested them. Adam, if you want
> to reply with a Tested-by tag, that would be appreciated.
> 
> Laurent Pinchart (2):
>   media: sun6i-csi: capture: Use subdev operation to access bridge
>     format
>   media: sun6i-csi: subdev: Use subdev active state to store active
>     format
> 
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 211 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  23 +-
>  3 files changed, 110 insertions(+), 133 deletions(-)
> 
> 
> base-commit: 6599e683db1bf22fee74302c47e31b9a42a1c3d2
Tested-by Adam Pigg <adam@piggz.co.uk>

I have used these 2 patches, along with the other 5 here [1] to successfully
capture frames on the Pinephone rear camera (ov5640) using libcamera and its 
cam utility.

I will submit the other patches here shortly.

[1] https://github.com/sailfish-on-dontbeevil/kernel-megi/commits/pinephone-libcamera

--nextPart3209878.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEG9S9FlpVKT4WucElgZzecrq7HBkFAmO3Rb4ACgkQgZzecrq7
HBkVUA//YXWRrD33nE20D40rhD6rRbRGYM8GvA1v90f8+CNBst141aUL9FQa49CS
tI6oDTgZupUB0Inn2mPWxQEhKDOkwLAt+k6S0OtTPHIa2ooqY6/U7wGYRaZAe8YP
faFSxL+helPwpy2VWKFbwNxJeRAcBSL0vvMLafZuUz4et4rbBceTIeAL0cqUUB5L
mbIiGLcqu9d2ixh1HtceUsXMMS/9n0TP1uZ54E7rKDAjBjGo+3vLCf92oDe0xw5A
9Z7k3uiMANJcqXKyAeUrJBiRGm0v48S5bUFe3VeBIM3DeYdB75kcv8b/S4dc5Nds
+O9YNhfz4nrYycOMl57O1HV4iMpELUqbs0uuT9u8nNsZCAW9BbNDXCSFd+xd0+zV
PRXTZgYcsmOROT1f/5pUYqd4ay+M6hd60cWR92Ddb0qFvPsi1ONq3XsHz26/N46R
4valKT9Zh/V+iOPg6FBbEtK5v+OcC2xlb/MdJ31E3E0mjI/KsFP3ct+q5h0FTWKn
OKMJu6VPAr/06eDWAqm8DozKQOzOiYuZG78VoW5PepvnRB1zentZYsfJZjsr+f1g
bszBL5vXktUbtM8WmSl489C1p6IAQPPF8DlW7QkTB3zgHXMhCM7i8PNijyJ/pmgs
q1DvAh4FnO1NE1X2OPgtzaXK3bLtCiogeZVTgQELzbCSEphDyCY=
=GNd6
-----END PGP SIGNATURE-----

--nextPart3209878.aeNJFYEL58--



