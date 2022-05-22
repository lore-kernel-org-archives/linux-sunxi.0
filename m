Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D15211F
	for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 10:53:09 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id v11so11328562pff.6
        for <linux-sunxi@lists.linux.dev>; Sun, 22 May 2022 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:references:mime-version:message-id
         :content-transfer-encoding;
        bh=bSbLSYLiEVp5Ck75TvixzyuLOTYB4+YAC/RLwIpjiSE=;
        b=oOmOzcOCSEk/WVR9gogBlVXlbC+V8Yhj+SWAhCXFbfy9LncFZjitmN4O+IcmRrjmsV
         2vOeMMJa3X7fb6G+0nUKOZQx43MAsPKyLqZfLl0aw3JjRcGdI2IPXGH5aEuLFIjwYlkE
         CJfPRxaTz4H+ld7jH40fhBkfE9k3uC1DE9KEZx61sAbPvj8XMerqLMcIPxpKu0+lEv9h
         jgXyaHSUMfa+CCaO1anbRFgBLMjxYhCXvgMslS897C7DqW3AkOZLImftxZfcMtpd7+Qi
         zNqqT86NHh1TS5Oqiaoht2Hrn6U4aJ1EqHjKaT2Vxja+HnEv2iTT9nme8+ah8jyQGOvq
         uqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:references:mime-version
         :message-id:content-transfer-encoding;
        bh=bSbLSYLiEVp5Ck75TvixzyuLOTYB4+YAC/RLwIpjiSE=;
        b=R4VebhoMiepGX2IMNlM9f6UXhlw9RD9ThUK+wmyWv3TNOJTIr2FYFYN70TDMMYm9Db
         lucKfkxlZGV+HRilvd7EhtAKWTOn/DYfc1PUjK5G8Ay2Ri9HyiBRuDqiDBru2cOWcZMf
         gAfsZ0Yhi6I7+BnlTGS/Tg89RgCp876xQ5PLon3cFnlqFDE+I1LiwA6kbIbG8pwU6nWW
         KsJ8E1XrkRNCoDxdMzmeFcT0hKp02PA0qdbMUkeJK1/zNqZaPU+lWIVS5ia4tWSJfJc7
         YUR0GKby8SfkrGoDsy2h4Mu9eOvCt2ljq/AAfUgRA/5yX/Py1awqh8Kx+56hH1OBr3bL
         LkZA==
X-Gm-Message-State: AOAM531LSC+kWE4tbQ59PgeoomQWZA9v3MPjM412ty7EOOYTCpPOpKDq
	xR24NWJMdeeTXLKYD8tgPNI=
X-Google-Smtp-Source: ABdhPJzuGobPl0n/IDwG0R6zGw+enGaFKapO6cpkrcksA2pK/rcVkCHeFnnQEze9bx97oxKIyAQWRQ==
X-Received: by 2002:a63:3d87:0:b0:3f6:1c54:b315 with SMTP id k129-20020a633d87000000b003f61c54b315mr16471834pga.432.1653216789034;
        Sun, 22 May 2022 03:53:09 -0700 (PDT)
Received: from DESKTOP-PUVK7A5 ([144.24.65.202])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709028d9700b0016160b3331bsm973618plo.305.2022.05.22.03.53.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 May 2022 03:53:08 -0700 (PDT)
Date: Sun, 22 May 2022 18:53:14 +0800
From: "benlypan@gmail.com" <benlypan@gmail.com>
To: jernej.skrabec <jernej.skrabec@gmail.com>, 
	mripard <mripard@kernel.org>, 
	wens <wens@csie.org>
Cc: airlied <airlied@linux.ie>, 
	daniel <daniel@ffwll.ch>, 
	samuel <samuel@sholland.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-sunxi <linux-sunxi@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sun4i: mixer: fix scanline for V3s and D1
References: <20220521133443.1114749-1-benlypan@gmail.com>, 
	<3173956.44csPzL39Z@jernej-laptop>
X-Priority: 3
X-GUID: 44554B07-4D1B-4258-8E6F-B7B805B582F0
X-Has-Attach: no
X-Mailer: Foxmail 7.2.20.259[cn]
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-ID: <202205221853133067396@gmail.com>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: base64

SGkgSmVybmVqIQoKPiBXaGljaCBTREs/IEFsbCBTREtzIHRoYXQgSSBoYXZlIG9yIGZvdW5kIG9u
IGludGVybmV0IGRvbid0IG1lbnRpb24gWVVWIG5vciBSR0IKPiBzY2FubGluZSBsaW1pdC4gVGhh
dCBkb2Vzbid0IG1lYW4gdGhlcmUgaXMgbm9uZSwgSSdtIGp1c3QgdW5hYmxlIHRvIHZlcmlmeQo+
IHlvdXIgY2xhaW0uIERpZCB5b3UgdGVzdCB0aGlzIGJ5IHlvdXJzZWxmPyBBbHNvLCBwbGVhc2Ug
bWFrZSBZVVYgc2NhbmxpbmUKPiBjaGFuZ2Ugc2VwYXJhdGUgcGF0Y2ggd2l0aCBmaXhlcyB0YWcu
CgpIZXJlIGlzIHRoZSBjb2RlIGFib3V0IHNjYW5saW5lIGNvbmZpZyBmb3IgVjNzOgpodHRwczov
L2dpdGh1Yi5jb20vVGluYS1MaW51eC90aW5hLXYzcy1saW51eC00LjkvYmxvYi9tYXN0ZXIvZHJp
dmVycy92aWRlby9mYmRldi9zdW54aS9kaXNwMi9kaXNwL2RlL2xvd2xldmVsX3N1bjhpdzgvZGVf
ZmVhdC5jI0w1NQpodHRwczovL2dpdGh1Yi5jb20vVGluYS1MaW51eC90aW5hLXYzcy1saW51eC00
LjkvYmxvYi9tYXN0ZXIvZHJpdmVycy92aWRlby9mYmRldi9zdW54aS9kaXNwMi9kaXNwL2RlL2xv
d2xldmVsX3N1bjhpdzgvZGVfcnRteC5jI0wxMjEyCgpBbmQgaGVyZSBpcyBmb3IgRDE6Cmh0dHBz
Oi8vZ2l0bGFiLmNvbS93ZWlkb25nc2hhbi90aW5hLWQxLWgvLS9ibG9iL21haW4vbGljaGVlL2xp
bnV4LTUuNC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnhpL2Rpc3AyL2Rpc3AvZGUvbG93bGV2ZWxf
djJ4L2RlX2ZlYXQuYyNMMTgyCmh0dHBzOi8vZ2l0bGFiLmNvbS93ZWlkb25nc2hhbi90aW5hLWQx
LWgvLS9ibG9iL21haW4vbGljaGVlL2xpbnV4LTUuNC9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3N1bnhp
L2Rpc3AyL2Rpc3AvZGUvbG93bGV2ZWxfdjJ4L2RlX3J0bXguYyNMMTU4OAoKSSB3YXMgdGVzdGVk
IGl0IG9uIFYzcy4gV2l0aG91dCB0aGlzIHBhdGNoLCB0aGUgcGxhbmUgd2lsbCBub3QgZGlzcGxh
eQpjb3JyZWN0bHkgaWYgc3JjX3cgbGFyZ2UgdGhhbiAxMDI0LCBmb3IgYm90aCBZVVYgYW5kIFJH
Qi4gSSBkb24ndCBoYXZlIGEKZGV2aWNlIHdpdGggRDEsIHNvIEQxIGlzIG5vdCB0ZXN0ZWQuIEJ1
dCBhY2NvcmRpbmcgdG8gdGhlIFNESyBjb2RlIG9mIEQxLAp0aGUgc2NhbmxpbmUgdmFsdWUgb2Yg
bWl4ZXIxIGlzIDEwMjQuCgpJJ20gbmV3IHRvIHN1Ym1pdHRpbmcgcGF0Y2hlcywgU28gbWF5IEkg
YXNrIGEgcXVlc3Rpb24/IElmIHRoZXJlIGlzIG5vCnByb2JsZW0gd2l0aCB0aGlzIHBhdGNoLCB3
aGF0IEkgbmVlZCB0byBkbyBpcyB0byBzZW5kIG5ldyBwYXRjaGVzIGFzIHlvdQpzdWdnZXN0ZWQ/
CgpCZXN0IHJlZ2FyZHMsCkdlbmZ1IFBhbgoK

